import '../models/get_barang_model.dart';

class GetBarangResponse {
  List<GetBarangModel> listPost = [];

  //kamu akan melakukan perulangan, data ditaruh di json dlu
  //kan mau bikin perulangan 100 data berarti index nya sampe 99
  GetBarangResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      //isinya nanti ditangkap sama postmodel
      GetBarangModel getbarangmodel = GetBarangModel.fromJson(json[i]);
      //datanya dari postModel dimasukin ke listpost
      listPost.add(getbarangmodel);
    }
  }
}
