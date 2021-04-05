class Item {
  int _idbrg;
  String _nama;
  String _merk;
  int _harga;
  int _stock;
  String _kodebarang;
  int _expired;
//getter akan mengambil nilai yang dimasukkan ke consturctor dan setter ini akan dipakai untuk
//mengembalikan nilai yang dimasukkan dari constructor, untuk setiap variable.
 
 get idbrg => this._idbrg;

 set idbrg( value) => this._idbrg = value;

  get nama => this._nama;

  set nama(value) => this._nama = value;

  get merk => this._merk;

  set merk(value) => this._merk = value;

  get harga => this._harga;

  set harga(value) => this._harga = value;

  get stock => this._stock;

  set stock(value) => this._stock = value;

  get kodebarang => this._kodebarang;

  set kodebarang(value) => this._kodebarang = value;

  get expired => this._expired;

  set expired(value) => this._expired = value;

// konstruktor versi 1
// untuk mengeset nama,merk,harga,stock,kode barang,expired secara bersama - sama
  Item(this._nama,this._merk, this._harga, this._stock, this._kodebarang, this._expired);

// konstruktor versi 2: konversi dari Map ke Item
// digunakan untuk mengambil data dari sql yang
//tersimpan berbentuk Map setelah itu akan disimpan kembali dalam bentuk variabel
  Item.fromMap(Map<String, dynamic> map) {
    this._idbrg = map['idbrg'];
    this._nama = map['nama'];
    this._merk = map['merk'];
    this._harga = map['harga'];
    this._stock = map['stock'];
    this._kodebarang = map['kodebarang'];
    this._expired = map['expired'];
  }
// konversi dari Item ke Map
//  untuk melakukan update dan insert
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idbrg'] = this._idbrg;
    map['nama'] = nama;
    map['merk'] = merk;
    map['harga'] = harga;
    map['stock'] = stock;
    map['kodebarang'] = kodebarang;
    map['expired'] = expired;
    return map;
  }
}
