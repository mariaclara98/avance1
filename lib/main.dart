import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/screens/home_page.dart';

//0. Inicio de la ejecución
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = ThemeData(primarySwatch: Colors.orange);

    //1. MaterialApp inicializa la Aplicación móvil
    MaterialApp myApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Proyecto API",
      home: const MyHomePage(title: "Top 100 Películas"),
      theme: myTheme,
    );

    return myApp;
  }
}
