import 'package:my_app/screens/addmemos.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/memolist.dart';

import 'auth/login.dart';
import 'package:flutter/material.dart';
import 'auth/signUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(primaryColor: Color(0xff3A4664)),
      routes: {
        "login": (context) => const Login(),
        "SignUp": (context) => const SignUp(),
        "HomePage": (context) => const HomePage(),
        "MemoList": (context) => Memolist(),
        "addmemos": (context) => AddMemos(),
      },
    );
  }
}
