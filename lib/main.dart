import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/multi_bloc_provider/multi_bloc_provider.dart';


void main() {
  runApp(const GetMaterialApp(home:MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      // home: Example1(),
      // home: GetDataFromServer(),
      home: MultiBlocProviderPage(),
    );
  }
}

