
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/home/Home.dart';
import 'package:getx_sample/teacher_login/teacher_login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>TeacherLogin())
      ],
    );
  }
}

