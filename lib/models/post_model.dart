class PostModel {
  String? id;
  String? nama;
  String? stok_barang;
  String? harga;
  String? kategori;
  String? keterangan;

  //buat contructor
  PostModel({
    required this.id, required this.nama, required this.stok_barang, required this.harga, required this.kategori, required this.keterangan});

  //buat contructor custom
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    stok_barang = json['stok_barang'];
    harga = json['harga'];
    kategori = json['kategori'];
    keterangan = json['keterangan'];
  }
}