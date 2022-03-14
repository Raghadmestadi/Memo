
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:my_app/models/memo.dart';



class DatabaseHelper{

final String memoTable = 'memoTable';
final String colId = 'Id';
final String colTitle = 'title';
final String colDescription = 'description';
final String colDate = 'date';

static final  DatabaseHelper _instance = new DatabaseHelper.internal() ;
DatabaseHelper.internal() ; 
factory DatabaseHelper()=>_instance;
static Database _db; 
 Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }


	


Future<Database> initDatabase() async {
	Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "memo.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return ourDb;}



void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $memoTable( $colId INTEGER PRIMARY KEY, $colTitle TEXT,$colDescription TEXT,$colDate TEXT )');
	}

  Future<int> saveItem( Memo memoItem) async {
    
    var dbClient = await db;

    int result = await dbClient.insert(memoTable, memoItem.toMap());
    return result;
  }

  Future<List> getAllItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $memoTable");
    return result.toList();
  }

 

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery("SELECT COUNT(*) FROM $memoTable"));
  }

  Future<Memo> getMemoItem(int itemId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $memoTable WHERE $colId = $itemId");
    if (result.length == 0) return null;
    return new Memo.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(memoTable, where: "$colId = ?", whereArgs: [id]);
  }

  Future<int> updateItem(Memo item) async {
    var dbClient = await db;
    return await dbClient.update(memoTable, item.toMap(),where: "$colId = ? ", whereArgs: [item.id]);
  }
  
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}