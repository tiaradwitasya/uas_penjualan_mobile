import 'package:aplikasi_penjualan/response/postbarang_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../response/getbarang_response.dart';

class ApiService {
  //datanya ditangkapnya di class response
  //kalau nullable pake ?
  Future<GetBarangResponse?> getPosts({String? searchQuery}) async {
    try {
      String url = 'http://10.0.2.2/crud_penjualan/index.php?';

      // Jika ada pencarian, tambahkan query parameter ke URL
      if (searchQuery != null) {
        url += 'tipe=searchbarang&namabarang=$searchQuery';
      } else {
        url += 'tipe=getdatabarang';
      }

      final response = await Dio().get(url);

      debugPrint('GET POST : ${response.data}');

      return GetBarangResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<PostDataResponse?> sendPostTransaksi(Map<String, dynamic> data) async {
    try {
      final response = await Dio().post(
          'http://10.0.2.2/crud_penjualan/index.php?tipe=posttransaksi',
          data: data);
      debugPrint('POST response: ${response.data}');
      return PostDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<GetBarangResponse?> searchbarang({String? namabarang}) async {
    try {
      final response = await Dio().post(
        'http://10.0.2.2/crud_penjualan/index.php?tipe=posttransaksi&namabarang=${namabarang}',
      );
      debugPrint('POST response: ${response.data}');
      return GetBarangResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
