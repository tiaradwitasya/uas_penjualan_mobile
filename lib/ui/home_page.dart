import 'package:aplikasi_penjualan/models/post_model.dart';
import 'package:aplikasi_penjualan/response/post_response.dart';
import 'package:aplikasi_penjualan/ui/form_transaksi.dart';
import 'package:flutter/material.dart';

import '../service/api_service.dart';

class Homepage extends StatelessWidget {
  var postRespon;

  Homepage({super.key});

  //deklarasi method di class API_service
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of post'),
        ),
        body: FutureBuilder(
          future: apiService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //jika
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              //simpan dlu data ke dalam model post response
              PostResponse postResponse = snapshot.data;
              //lalu buat dalam bentuk list yang isinya postrespone.listpost
              List<PostModel> listPost = postResponse.listPost;
              //lalu tampilkan datanya
              return ListView.builder(
                  //item count menunjukkan berapa banyak sih data
                  //item builder menampilkan datanya
                  itemCount: listPost.length,
                  itemBuilder: (context, index) {
                    PostModel postModel = listPost[index];
                    return Card(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postModel.nama.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    postModel.harga.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FormTransaksiScreen(data:postModel)));
                                  },
                                  child: Text("Beli")),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ));
  }
}
