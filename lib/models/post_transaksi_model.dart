class PostTransaksiModel {
  String? id;
  String? id_barang;
  String? nama_pelanggan;
  String? alamat;
  String? no_hp;
  String? total_harga;
  String? jumlah_barang;

  PostTransaksiModel(
      {this.id,
      this.id_barang,
      this.nama_pelanggan,
      this.alamat,
      this.no_hp,
      this.total_harga,
      this.jumlah_barang});

  PostTransaksiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id_barang = json['id_barang'];
    nama_pelanggan = json['nama_pelanggan'];
    alamat = json['alamat'];
    no_hp = json['no_hp'];
    total_harga = json['total_harga'];
    jumlah_barang = json['jumlah_barang'];
  }
}
