import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/models/memo.dart';
import 'package:my_app/utils/database_helper.dart';
import 'package:my_app/screens/addmemos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class Memolist extends StatefulWidget {
  Memolist({Key key}) : super(key: key);

  @override
  _MemolistState createState() => _MemolistState();
}

class _MemolistState extends State<Memolist> {
 var db = DatabaseHelper();
 TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
	 final List<Memo> _itemsList = <Memo>[] ;

   @override
  void initState() {
    super.initState();
     _readMemoList ();
  }

  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:Text('THE MEMOS ' , style: TextStyle(),) ,
         automaticallyImplyLeading: false

      ),
floatingActionButton: FloatingActionButton( backgroundColor: Theme.of(context).primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ) , child: Icon(Icons.add), onPressed: (){
// Navigator.of(context).pushNamed("addmemos");
_showFormDialog();

},),
      body: getMemolistView(),
    );
}
ListView getMemolistView(){
  return ListView.builder(
    itemCount: _itemsList.length,
    itemBuilder: (_, int index ) {
      return Card(
color: Colors.white,
child: ListTile(
  onLongPress: ()=> _updateItem(_itemsList[index],index),
  title:Text(_itemsList[index].title),
  subtitle:  Text(_itemsList[index].date),
   trailing: GestureDetector(
     key: Key(_itemsList[index].title),
     child: Icon(Icons.remove_circle ,color: Colors.grey,),
   onTap: (){
    _handleDelete(_itemsList[index].id, index);
   },),
  
     leading: Icon(Icons.sticky_note_2, color: Color(0xffEAA0A2),),),

      ) ;
    },
  );
}
 void _showFormDialog() {
    var alert = new AlertDialog(
      content: new Column(
        mainAxisSize: MainAxisSize.min ,
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: <Widget>[
          Text('Add Memo ',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22 , color:Theme.of(context).primaryColor ),),
         TextFormField(
  onChanged:(value){
  
},
  controller: titleController,
  autofocus: true,
  maxLength: 30,
  decoration: InputDecoration(filled: true,
fillColor: Colors.white,
labelText: "title",



),),
TextFormField(
  onChanged:(value){

},
  controller:descriptionController,
  autofocus: true,
  maxLength: 200,
  minLines: 1,
  maxLines: 3,
  decoration: InputDecoration(filled: true,
fillColor: Colors.white,
labelText: "Memo",


),),
 ],
      ),
      
      actions: <Widget>[
        new ElevatedButton(
            onPressed: () {
              _handleSubmit(titleController.text);
              titleController.clear();
              Navigator.pop(context);
            },
            child: Text("Save"),style: ElevatedButton.styleFrom(
                       primary: Color(0xff3A4664),
                       padding: const EdgeInsets.symmetric(horizontal:50
                       , vertical: 5))),
        new ElevatedButton(
           
            onPressed: () => Navigator.pop(context), child: Text("Cancel") ,style: ElevatedButton.styleFrom(
                       primary: Color(0xff3A4664),
                       padding: const EdgeInsets.symmetric(horizontal:50
                       , vertical: 5)))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
_readMemoList () async{
  List items = await db.getAllItems();
 items.forEach((item) {
 
// print("db items = ${meomItem.title}");
  setState(() {
        _itemsList.add(Memo.map(item));
      });
    });
}
  void _handleSubmit(String text) async{
  Memo item = new  Memo(text, new DateTime.now().toIso8601String());
  int savedItemId = await db.saveItem(item);
    Memo savedItem = await db.getMemoItem(savedItemId);
    print("saveId=$savedItemId save item = ${savedItem.title}");
setState(() {
  _itemsList.insert(0, savedItem);
});
}
//   void handleSubmit(String text) async{
//   Memo item = new  Memo(text, new DateTime.now().toIso8601String());
//   int savedItemId = await db.saveItem(item);
//     Memo savedItem = await db.getMemoItem(savedItemId);
// print('s id = $savedItemId and s item = ${savedItem.title}');
// }
 void _handleDelete(int  id, int index) async{
await db.deleteItem(id);
print (id);
setState(() {
  _itemsList.removeAt(index);
});

  }

  _updateItem(Memo _itemsList, int index) {



  }

  
}

