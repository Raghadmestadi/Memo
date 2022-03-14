import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/models/memo.dart';
import 'package:my_app/utils/database_helper.dart';
import 'package:my_app/screens/addmemos.dart';
import 'package:sqflite/sqflite.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 DatabaseHelper helper = DatabaseHelper();
  List<Memo> memoList;
	int count = 0;

  List memos =[
{
  'title':'memo1',
  'memo':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .'
},
{
  'title':'memo2',
  'memo':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod .'
},
{
  'title':'memo3',
  'memo':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod .'
},
];
   @override
  Widget build(BuildContext context) {
    
		// if (memoList == Null) {
		// 	memoList = List<Memo>();;
		
		// }

    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:Text('HOME PAGE ' , style: TextStyle(),) ,
         automaticallyImplyLeading: false

      ),
floatingActionButton: FloatingActionButton( backgroundColor: Theme.of(context).primaryColor, child: Icon(Icons.add), onPressed: (){
Navigator.of(context).pushNamed("addmemos");

},),
      body: Container(

      child: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, i) {
          return Dismissible(key: Key("$i"), child: MemoList(memos:memos[i],));
        },
      ),
      ),
    );
  }
}

class MemoList extends StatefulWidget {
  final memos;
  MemoList({this.memos});

  @override
  State<MemoList> createState() => _MemoListState();

  static void handleSubmit(String text) {}
}

class _MemoListState extends State<MemoList> {
  @override
  Widget build(BuildContext context) {
   return Card(child: 
   Expanded(
     child: ListTile(title: Text("${widget.memos['title']}"),
     subtitle: Text("${widget.memos['memo']}"),
     trailing: IconButton(onPressed: (){},icon: Icon(Icons.edit),),
     leading: Icon(Icons.sticky_note_2, color: Color(0xffEAA0A2),),
     ),
   ));
  }
}