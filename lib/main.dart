import 'package:flutter/material.dart';
import 'package:newsapp/screens/welcome_screen.dart';



void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenState(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(),
      home:  const SplashScreenState (),
    );
  }
}

