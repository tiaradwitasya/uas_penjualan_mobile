class getMyOrderModel {
  String? id;
  String? id_barang;
  String? nama_pelanggan;
  String? alamat;
  String? no_hp;
  String? total_harga;
  String? harga_barang;
  String? nama_barang;
  String? jumlah_barang;
  String? kategori;
  String? keterangan;

  //buat contructor
  getMyOrderModel({
    required this.id,
    required this.id_barang,
    required this.nama_pelanggan,
    required this.alamat,
    required this.no_hp,
    required this.total_harga,
    required this.harga_barang,
    required this.nama_barang,
    required this.jumlah_barang,
    required this.kategori,
    required this.keterangan,
  });

  //buat contructor custom
  getMyOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id_barang = json['id_barang'];
    nama_pelanggan = json['nama_pelanggan'];
    alamat = json['alamat'];
    no_hp = json['no_hp'];
    total_harga = json['total_harga'];
    harga_barang = json['harga'];
    nama_barang = json['nama'];
    jumlah_barang = json['jumlah_barang'];
    kategori = json['kategori'];
    keterangan = json['keterangan'];
  }
}
