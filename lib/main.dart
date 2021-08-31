import 'package:ejemplo_disenos_firebase/pages/ficha_page.dart';
import 'package:ejemplo_disenos_firebase/pages/home_page.dart';
import 'package:ejemplo_disenos_firebase/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'home': (_) => HomePage(),
        'ficha': (_) => FichaPage(),
      },
    );
  }
}
