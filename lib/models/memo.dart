import 'package:flutter/cupertino.dart';

class Memo{
int  _id;
 String _title;
 String _description;
 String _date;
 

  Memo(this._title,this._date,[this._description]);

  Memo.withId(this._id,this._title,this._date,[this._description]);
   int  get id => _id ;
  String  get title => _title;
  String get description => _description;
  String get date => _date;
 
 set Title(String newTitle){
   if (newTitle.length <=30){
     this._title =newTitle;
   }
 }

 
 set description (String newDescription){
   if (newDescription.length <=255){
     this._description =newDescription;
   }
 }
 set date (String newDate){
   this.date=newDate;
 }

 Memo.map(dynamic  obj){
    this._title = obj["title"];
    this._description = obj["description"];
    this._date = obj["date"];
    this._id = obj["id"];
  }

Map<String, dynamic> toMap()  {
  var map = Map<String, dynamic> ();
  if (id !=null ){
    map["id"]=_id;
  }
  map['title'] = _title;
  map['description'] = _description;
  map['date'] = _date;
  
  return map;

}

 Memo.fromMap(Map<String,dynamic> map){
    this._title =  map["title"];
    this._description =  map["description"];
    this._id =  map["id"];
    this._date =  map["date"];
  }

}

