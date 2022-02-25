import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import 'src/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: const MaterialApp(
          title: 'Infinite List Sample',
          home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite List Sample').
      ),
    );
  }
}

