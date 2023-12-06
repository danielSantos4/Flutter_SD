import 'package:flutter/material.dart';
import 'package:trabalhosd/view/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Chamada Automática',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MyHomePage(title: 'Página Inicial'),
    );
  }
}

