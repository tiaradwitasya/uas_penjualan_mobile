import 'package:aplikasi_penjualan/models/post_transaksi_model.dart';

class PostDataResponse {
  List<PostTransaksiModel> listPost = [];

  PostDataResponse.fromJson(List<dynamic> json) {
    json.forEach((post) {
      PostTransaksiModel posttransaksimodel = PostTransaksiModel.fromJson(post);
      listPost.add(posttransaksimodel);
    });
  }
}
