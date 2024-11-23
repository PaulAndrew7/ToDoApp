// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // initialize hive
  await Hive.initFlutter();

  // open a box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          //primarySwatch: Colors.yellow,
          //primaryColor: Colors.yellow[500],
            appBarTheme: AppBarTheme(color: const Color(0xFFCB9DF0),),
            useMaterial3: true
        )
    );
  }
}
