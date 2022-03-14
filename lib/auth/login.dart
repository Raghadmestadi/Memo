import 'package:flutter/material.dart';

class  Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
         Center(
           
           
           child:Image.asset("images/memo2.png") ,) ,
         Container(
           padding: const EdgeInsets.all(15),
           child: Form(child: Column(
             children: [TextFormField(
               decoration: const InputDecoration(
                 hintText: " Username" ,
                 prefixIcon: Icon(Icons.person),
                 border: OutlineInputBorder(borderSide: BorderSide(width: 1)
               
               )),
             ),
             const SizedBox(height: 20,),
             TextFormField(
               obscureText: true,
               decoration: const InputDecoration(
                 hintText: " password" ,
                 prefixIcon: Icon(Icons.person),
                 border: OutlineInputBorder(borderSide: BorderSide(width: 1)
               
               )),
             ),
             Container(
               margin: const EdgeInsets.all(10),
               // ignore: prefer_const_constructors
               child: Row(children: [Text('if you dont have an account '),
               InkWell(
                onTap: () { Navigator.of(context).pushNamed('SignUp'); },
                 child: const Text('click here',style: TextStyle(color: Colors.grey),),)
               ],),
             ),
             // ignore: avoid_unnecessary_containers
             Container(
               
               child: ElevatedButton(onPressed: (){
               Navigator.of(context).pushReplacementNamed('MemoList');
             } ,child:const Text("Login", style: TextStyle(fontSize: 20),) , style: ElevatedButton.styleFrom(
               primary: Color(0xff3A4664),
               padding: const EdgeInsets.symmetric(horizontal: 50)
              
             ), ) )
             ],
             
           )),
         )


        ],)
    );
  }
}