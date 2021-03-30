import 'package:flutter/material.dart';
import 'penjualan.dart';

class EntryFormPenjualan extends StatefulWidget {
  final Penjualan jual;
  EntryFormPenjualan(this.jual);
  @override
  EntryFormPenjualanState createState() => EntryFormPenjualanState(this.jual);
}

//class controller
class EntryFormPenjualanState extends State<EntryFormPenjualan> {
  Penjualan jual;
  EntryFormPenjualanState(this.jual);
  TextEditingController kodebrgController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahJualController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (jual != null) {
      kodebrgController.text = jual.kodebrg.toString();
      namaController.text = jual.nama;
      jumlahJualController.text = jual.jumlahJual.toString();
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: jual == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
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
// harga
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
                          if (jual == null) {
// tambah data
                            jual = Penjualan(int.parse(kodebrgController.text),
                                namaController.text,
                                int.parse(jumlahJualController.text),
                                );
                          } else {
// ubah data
                            jual.kodebrg = kodebrgController.text;
                            jual.nama = namaController.text;
                            jual.jumlahJual = int.parse(jumlahJualController.text);
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, jual);
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
