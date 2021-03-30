class Penjualan{
 int _kodebrg;
 String _nama;
 int _jumlahJual;

 get kodebrg => this._kodebrg;

 set kodebrg( value) => this._kodebrg = value;

  get nama => this._nama;

 set nama( value) => this._nama = value;

  get jumlahJual => this._jumlahJual;

 set jumlahJual( value) => this._jumlahJual = value;

Penjualan(this._kodebrg, this._nama, this._jumlahJual);

Penjualan.fromMap(Map<String, dynamic> map) {
 this._kodebrg = map['kodebrg'];
 this._nama = map['nama'];
 this._jumlahJual = map['jumlahJual'];

}

 Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['kodebrg'] = this._kodebrg;
    map['nama'] = nama;
    map['jumlahJual'] = jumlahJual;
    return map;
 }

}