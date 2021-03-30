import 'package:flutter/material.dart';
import 'package:uts/model/homePenjualan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambah Data',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePenjualan(),
    );
  }
}