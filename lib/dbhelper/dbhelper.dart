import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uts/model/item.dart';
import 'package:uts/model/penjualan.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'TokoFrozen.db';

    //create, read databases
    var tokofrozenDatabase =
        openDatabase(path, version: 11, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return tokofrozenDatabase;
  }

  //update tabel
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  //pembuatan table item
  void _createDb(Database db, int version) async {
  var batch = db.batch();
  batch.execute('DROP TABLE IF EXISTS item');
   await batch.execute('DROP TABLE IF EXISTS penjualan');
  batch.execute('''
CREATE TABLE item (
idbrg INTEGER PRIMARY KEY AUTOINCREMENT,
nama TEXT,
merk TEXT,
harga INTERGER,
stock INTEGER,
kodebarang TEXT,
expired INTEGER
)
''');
//pembuatan tabel penjualan
 batch.execute('''
CREATE TABLE penjualan (
idPenjualan INTEGER PRIMARY KEY AUTOINCREMENT,
kodebarang TEXT,
nama TEXT,
jumlahJual INTEGER
)
''');
  await batch.commit();
}


  //fungsi untuk select database
  Future<List<Map<String, dynamic>>> selectitem() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'nama');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectpenjualan() async {
    Database db = await this.initDb();
    var mapList = await db.query('penjualan', orderBy: 'nama');
    return mapList;
  }

  //fungsi untuk mengisi data pada tabel item
  Future<int> insertitem(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //fungsi untuk mengisi data pada tabel penjualan
  Future<int> insertpenjualan(Penjualan object) async {
    Database db = await this.initDb();
    int count = await db.insert('penjualan', object.toMap());
    return count;
  }

  //fungsi untuk update data tabel item
  Future<int> updateitem(Item object) async {
    Database db = await this.initDb();
    int count = await db.update('item', object.toMap(),
        where: 'idbrg=?', whereArgs: [object.idbrg]);
    return count;
  }

  //fungsi untuk update tabel penjualan
  Future<int> updatepenjualan(Penjualan object) async {
    Database db = await this.initDb();
    int count = await db.update('penjualan', object.toMap(),
        where: 'idPenjualan=?', whereArgs: [object.idPenjualan]);
    return count;
  }
  //fungsi untuk menghapus data tabel item

  Future<int> deleteitem(int idbrg) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'idbrg=?', whereArgs: [idbrg]);
    return count;
  }
  //fungsi untuk menghapus data tabel penjualan

  Future<int> deletepenjualan(int idPenjualan) async {
    Database db = await this.initDb();
    int count = await db
        .delete('penjualan', where: 'idPenjualan=?', whereArgs: [idPenjualan]);
    return count;
  }

  //fungsi untuk mengembalikan nilai data data yang baru dimasukkan
  Future<List<Item>> getItemList() async {
    var itemMapList = await selectitem();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Penjualan>> getPenjualanList() async {
    var penjualanMapList = await selectpenjualan();
    int count = penjualanMapList.length;
    List<Penjualan> penjualanList = List<Penjualan>();
    for (int i = 0; i < count; i++) {
      penjualanList.add(Penjualan.fromMap(penjualanMapList[i]));
    }
    return penjualanList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}