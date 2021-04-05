class Penjualan {
  int _idPenjualan;
  String _kodebarang;
  String _nama;
  int _jumlahJual;

  get idPenjualan => this._idPenjualan;

  set idPenjualan(value) => this._idPenjualan = value;

  String get kodebarang => this._kodebarang;

 set kodebarang(String value) => this._kodebarang = value;

  get nama => this._nama;

  set nama(value) => this._nama = value;

  get jumlahJual => this._jumlahJual;

  set jumlahJual(value) => this._jumlahJual = value;

  Penjualan(this._kodebarang, this._nama, this._jumlahJual);

  Penjualan.fromMap(Map<String, dynamic> map) {
    this.idPenjualan = map['idPenjualan'];
    this._kodebarang = map['kodebarang'];
    this._nama = map['nama'];
    this._jumlahJual = map['jumlahJual'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idPenjualan'] = idPenjualan;
    map['kodebarang'] = kodebarang;
    map['nama'] = nama;
    map['jumlahJual'] = jumlahJual;
    return map;
  }
}
