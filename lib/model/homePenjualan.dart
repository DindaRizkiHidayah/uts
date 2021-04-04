import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:uts/dbhelper/dbhelper.dart';
import 'package:uts/model/entryformPenjualan.dart';
import 'package:uts/model/penjualan.dart';//pendukung program asinkron

class HomePenjualan extends StatefulWidget {
  @override
  HomePenjualanState createState() => HomePenjualanState();
}

class HomePenjualanState extends State<HomePenjualan> {
  DbHelper dbHelper = DbHelper();
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
              child: Text("Tambah Penjualan"),
              onPressed: () async {
                var penjualan = await navigateToEntryForm(context, null);
                if ( penjualan != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertpenjualan(penjualan);
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

  Future<Penjualan> navigateToEntryForm(BuildContext context, Penjualan penjualan) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormPenjualan(penjualan);
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
            title: Text(
              this.penjualanList[index].nama,
              style: textStyle,
            ),
            subtitle: Text("Kode Barang : " + this.penjualanList[index].kodebrg.toString()+ "\n" 
            + "Nama :   " + this.penjualanList[index].nama.toString()+"\n"
            + "Jumlah Barang : " + this.penjualanList[index].jumlahJual.toString()+"\n"),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
//TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                int result = await dbHelper.deletepenjualan(this.penjualanList[index].idPenjualan);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var penjualan =
                  await navigateToEntryForm(context, this.penjualanList[index]);
//TODO 4 Panggil Fungsi untuk Edit data
              int result = await dbHelper.updatepenjualan(penjualan);
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
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Penjualan>> penjualanListFuture = dbHelper.getPenjualanList();
      penjualanListFuture.then((penjualanList) {
        setState(() {
          this.penjualanList = penjualanList;
          this.count = penjualanList.length;
        });
      });
    });
  }
}
