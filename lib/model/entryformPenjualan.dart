import 'package:flutter/material.dart';
import 'penjualan.dart';

class EntryFormPenjualan extends StatefulWidget {
  final Penjualan penjualan;
  EntryFormPenjualan(this.penjualan);
  @override
  EntryFormPenjualanState createState() => EntryFormPenjualanState(this.penjualan);
}

//class controller
class EntryFormPenjualanState extends State<EntryFormPenjualan> {
  Penjualan penjualan;
  EntryFormPenjualanState(this.penjualan);
  TextEditingController kodebrgController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahJualController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (penjualan != null) {
      kodebrgController.text = penjualan.kodebarang;
      namaController.text = penjualan.nama;
      jumlahJualController.text = penjualan.jumlahJual.toString();
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: penjualan == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// kode barang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodebrgController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// nama barang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
     //jumlah jual         
               Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jumlahJualController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Jual',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (penjualan == null) {
// tambah data
                            penjualan = Penjualan(kodebrgController.text,
                                namaController.text,
                                int.parse(jumlahJualController.text),
                                );
                          } else {
// ubah data
                            penjualan.kodebarang = kodebrgController.text;
                            penjualan.nama = namaController.text;
                            penjualan.jumlahJual = int.parse(jumlahJualController.text);
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, penjualan);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
