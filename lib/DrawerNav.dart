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
              accountName: Text("Frozen Food"),
              accountEmail: Text("dindarizky223@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/ogw/ADGmqu8SMTpgqq_YKNKxBIyuGTvcPskEVSIOnK2b5Yn5RA=s192-c-mo'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text("Data Penjualan Frozen Food"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePenjualan())),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Data Stock Frozen Food"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home())),
            ),
          ],
        ),
      ),
    );
  }
}