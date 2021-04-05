//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:uts/DrawerNav.dart';//package letak folder Anda

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'UTS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
   
   home : DrawerNav(),
      
      
      
    );
  }
}
