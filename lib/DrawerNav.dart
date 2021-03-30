import 'package:flutter/material.dart';
import 'package:uts/model/home.dart';
import 'package:uts/model/homePenjualan.dart';

class DrawerNav extends StatefulWidget {
  @override
  _DrawerNavState createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Dinda Rizki Hidayah"),
              accountEmail: Text("dindarizky223@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    ''),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text("Data Penjualan Barang"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePenjualan())),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Data Stock Barang"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home())),
            ),
          ],
        ),
      ),
    );
  }
}