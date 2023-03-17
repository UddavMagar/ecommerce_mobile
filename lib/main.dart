import 'package:flutter/material.dart';
import 'package:ecommerce_mobileapp/screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.green[40],
          ),
      initialRoute: MainPage.id,
      routes:{
        MainPage.id: (context) => MainPage(),
      },
      
    );
  }
}

