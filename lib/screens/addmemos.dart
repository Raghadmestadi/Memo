import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/models/memo.dart';
import 'package:my_app/utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:my_app/screens/memolist.dart';


class AddMemos extends StatefulWidget {
  AddMemos({Key key}) : super(key: key);

  @override
  _AddMemosState createState() => _AddMemosState();
}

class _AddMemosState extends State<AddMemos> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  var db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // titleController.text = memo.title;
		// descriptionController.text = memo.description;

 return Scaffold(
appBar: AppBar(title: Text("MEMOS"),
backgroundColor: Theme.of(context).primaryColor,),
body: Container(child:Column(children: [

  Form(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [


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

 Padding(
   padding: const EdgeInsets.all(10),
   child: Row(
     children: [

      Expanded(
        child: ElevatedButton(onPressed: (){

           MemoList.handleSubmit(titleController.text);
           setState(() {
             
           });
                       Navigator.of(context).pushReplacementNamed('MemoList');
                     } ,child:const Text("Add ",style: TextStyle(fontSize: 18),) , style: ElevatedButton.styleFrom(
                       primary: Color(0xff3A4664),
                       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5)
                      
                     ), ),
      ),
Container(width: 5.0,),
              Expanded(
                child: ElevatedButton(onPressed: (){
            
                   
                    
                       Navigator.of(context).pushReplacementNamed('MemoList');
                     } ,child:const Text("cancle ",style: TextStyle(fontSize: 18),) , style: ElevatedButton.styleFrom(
                       primary: Color(0xff3A4664),
                       padding: const EdgeInsets.symmetric(horizontal:50
                       , vertical: 5)
                      
                     ), ),
              ),     
     ],
   ),
 ) 
  ],))
],)),
    );

    
  }

//   void _handleSubmit(String text) async{
//   Memo item = new  Memo(text, new DateTime.now().toIso8601String());
//   int savedItemId = await db.saveItem(item);
//     Memo savedItem = await db.getMemoItem(savedItemId);
// print('s id = $savedItemId and s item = ${savedItem.title}');
// }
 
}

