import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:uts/dbhelper/dbhelperPenjualan.dart';
import 'package:uts/model/entryformPenjualan.dart';
import 'package:uts/model/penjualan.dart';
//pendukung program asinkron

class HomePenjualan extends StatefulWidget {
  @override
  HomePenjualanState createState() => HomePenjualanState();
}

class HomePenjualanState extends State<HomePenjualan> {
  DbHelperPenjualan dbHelperPenjualan = DbHelperPenjualan();
  int count = 0;
  List<Penjualan> penjualanList;
  @override
  Widget build(BuildContext context) {
    if (penjualanList == null) {
      penjualanList = List<Penjualan>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Daftar Penjualan Frozen Food')),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Barang"),
              onPressed: () async {
                var jual = await navigateToEntryFormPenjualan(context, null);
                if (jual != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelperPenjualan.insert(jual);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Penjualan> navigateToEntryFormPenjualan(BuildContext context, Penjualan jual) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormPenjualan(jual);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text("Kode Barang : "+
              this.penjualanList[index].kodebrg,
              style: textStyle,
            ),
            subtitle: Text("Nama : " + this.penjualanList[index].nama.toString()+ "\n" 
            + "Jumlah Jual :   " + this.penjualanList[index].jumlahJual.toString()+"\n"),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
//TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int result = await dbHelperPenjualan.delete(this.penjualanList[index].kodebrg);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var jual =
                  await navigateToEntryFormPenjualan(context, this.penjualanList[index]);
//TODO 4 Panggil Fungsi untuk Edit data
              int result = await dbHelperPenjualan.update(jual);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

//update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelperPenjualan.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Penjualan>> penjualanListFuture = dbHelperPenjualan.getpenjualanList();
      penjualanListFuture.then((penjualanList) {
        setState(() {
          this.penjualanList = penjualanList;
          this.count = penjualanList.length;
        });
      });
    });
  }
}
