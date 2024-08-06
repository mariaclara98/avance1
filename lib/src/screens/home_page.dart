import 'package:flutter/material.dart';

import 'package:flutter_movie_api/src/widgets/list_http_json.dart';

List<Widget> content = [
  const ListHtppJson(),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
          child: Center(
            child: SingleChildScrollView(child: content[_index]),
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: ((value) {
            _index = 0; //cambiar por value al crear el resto de pestañas
            setState(() {});
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Búsqueda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_sharp), label: "Cuenta"),
          ]),
    );
  }
}
