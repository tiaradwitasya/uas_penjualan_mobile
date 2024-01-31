import '../models/post_model.dart';

class PostResponse{
  List <PostModel> listPost = [];

  //kamu akan melakukan perulangan, data ditaruh di json dlu
  //kan mau bikin perulangan 100 data berarti index nya sampe 99
  PostResponse.fromJson(json){
    for(int i = 0; i < json.length; i++){
      //isinya nanti ditangkap sama postmodel
      PostModel postModel = PostModel.fromJson(json[i]);
      //datanya dari postModel dimasukin ke listpost
      listPost.add(postModel);
    }
  }
}
