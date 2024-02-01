import 'package:aplikasi_penjualan/response/postbarang_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../response/getbarang_response.dart';

class ApiService {
  //datanya ditangkapnya di class response
  //kalau nullable pake ?
  Future<GetBarangResponse?> getPosts() async {
    //pake trycatch untuk menanggulangi error
    //saat fetching data itu kan kita pake networking, bisa aja kan error misal hapenya gada network dll
    try {
      //variable namanya response
      //await Dio untuk komunikasi get data, masukin url dari rest api kita
      final response = await Dio()
          .get('http://10.0.2.2/crud_penjualan/index.php?tipe=getdatabarang');
      // get('http://10.0.0.2/api/post');
      // get('https://jsonplaceholder.typicode.com/posts');
      //response nya dipanggil pada data
      //kalau dia berhasil ngambil data maka dia akan cetak di console
      //misal data nya dimasukin ke variable berarti nulisnya response.data<data>
      debugPrint('GET POST : ${response.data}');
      //method yang ada di post response akan di return
      return GetBarangResponse.fromJson(response.data);

      //serrornya akan ditampilin cuma hanya di console
      //misal salah ketik kah atau dll
      //to
    } on DioException catch (e) {
      debugPrint(e.toString());
    }

    try {
      Future<PostDataResponse?> sendPostTransaksi(
          Map<String, dynamic> data) async {
        try {
          final response = await Dio().post(
              'http://10.0.2.2/crud_penjualan/index.php?tipe=posttransaksi',
              data: data);
          debugPrint('POST response: ${response.data}');
          return PostDataResponse.fromJson(response.data);
        } on DioError catch (e) {
          debugPrint(e.toString());
          return null;
        }
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
    }
  }
}
