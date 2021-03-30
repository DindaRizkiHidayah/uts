import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uts/model/penjualan.dart';
import '../model/penjualan.dart';

class DbHelperPenjualan {
  static DbHelperPenjualan _dbHelperPenjualan;
  static Database _database;
  DbHelperPenjualan._createObject();
  Future<Database> initDb() async {
//untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'penjualan.db';
//create, read databases
    var penjualanDatabase = openDatabase(path,
        version: 1,
        onCreate:
            _createDb,onUpgrade: _onUpgrade);
             //mengembalikan nilai object sebagai hasil dari fungsinya
    return penjualanDatabase;
  }
void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

//buat tabel baru dengan nama penjualan
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    await batch.execute('DROP TABLE IF EXISTS penjualan');
    await batch.execute('''
CREATE TABLE Penjualan (
kodebarang INTEGER PRIMARY KEY AUTOINCREMENT,
nama TEXT,
jumlahJual INTEGER
)
''');
await batch.commit();
  }

//select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('Penjualan', orderBy: 'nama');
    return mapList;
  }

//create databases
  Future<int> insert(Penjualan object) async {
    Database db = await this.initDb();
    int count = await db.insert('Penjualan', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Penjualan object) async {
    Database db = await this.initDb();
    int count = await db
        .update('Penjualan', object.toMap(), where: 'idbrg=?', whereArgs: [object.kodebrg]);
    return count;
  } //delete databases

  Future<int> delete(int kodebrg) async {
    Database db = await this.initDb();
    int count = await db.delete('Penjualan', where: 'idbrg=?', whereArgs: [kodebrg]);
    return count;
  }

  Future<List<Penjualan>> getpenjualanList() async {
    var penjualanMapList = await select();
    int count = penjualanMapList.length;
    List<Penjualan> penjualanList = List<Penjualan>();
    for (int i = 0; i < count; i++) {
      penjualanList.add(Penjualan.fromMap(penjualanMapList[i]));
    }
    return penjualanList;
  }

  factory DbHelperPenjualan() {
    if (_dbHelperPenjualan == null) {
      _dbHelperPenjualan = DbHelperPenjualan._createObject();
    }
    return _dbHelperPenjualan;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
