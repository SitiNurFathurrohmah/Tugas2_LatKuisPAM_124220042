import 'package:flutter/material.dart';
import 'package:latkuis_pam/pages/LoginPage.dart';

void main(){
  runApp(const MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp();

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "Belajar Memasak",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: LoginPage()
  );
}
}

