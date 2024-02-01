import 'package:aplikasi_penjualan/models/myorder_model.dart';

class MyOrderResponse {
  List<getMyOrderModel> listPost = [];

  //kamu akan melakukan perulangan, data ditaruh di json dlu
  //kan mau bikin perulangan 100 data berarti index nya sampe 99
  MyOrderResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      //isinya nanti ditangkap sama postmodel
      getMyOrderModel getorder = getMyOrderModel.fromJson(json[i]);
      //datanya dari postModel dimasukin ke listpost
      listPost.add(getorder);
    }
  }
}
