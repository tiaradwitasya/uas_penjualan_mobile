class Order {
  int id_barang;
  String nama_pelanggan;
  String alamat;
  String no_hp;
  int total_harga;
  int jumlah_barang;

  Order({
    required this.id_barang,
    required this.nama_pelanggan,
    required this.alamat,
    required this.no_hp,
    required this.total_harga,
    required this.jumlah_barang,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id_barang: json['id_barang'],
        nama_pelanggan: json['nama_pelanggan'],
        alamat: json['alamat'],
        no_hp: json['no_hp'],
        total_harga: json['total_harga'].toDouble(),
        jumlah_barang: json['jumlah_barang'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': id_barang,
        'nama_pelanggan': nama_pelanggan,
        'alamat': alamat,
        'no_hp': no_hp,
        'total_harga': total_harga,
        'jumlah_barang': jumlah_barang,
      };
}
