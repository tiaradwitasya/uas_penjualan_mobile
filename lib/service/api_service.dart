import 'dart:convert';
import 'package:aplikasi_penjualan/models/post_transaksi_model.dart';
import 'package:aplikasi_penjualan/response/myorder_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../response/get_barang_response.dart';

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

  Future<MyOrderResponse?> getMyOrder() async {
    try {
      String url =
          'http://10.0.2.2/crud_penjualan/index.php?tipe=lihattransaksi';
      // Jika ada pencarian, tambahkan query parameter ke URL

      final response = await Dio().get(url);
      debugPrint('GET POST : ${response.data}');
      return MyOrderResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<MyOrderResponse?> DeleteTransaksi(String id) async {
    try {
      String url =
          'http://10.0.2.2/crud_penjualan/index.php?tipe=deletetransaksi&idtransaksi=${id}';
      final response = await Dio().delete(url);
      debugPrint('GET POST : ${response.data}');
      return MyOrderResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<MyOrderResponse?> sendOrder(int id_barang, String nama, String alamat,
      String nohp, int total, int jumlah) async {
    try {
      final response = await Dio().post(
        'http://10.0.2.2/crud_penjualan/index.php?tipe=posttransaksi',
        data: {
          'id_barang': id_barang,
          'nama_pelanggan': nama,
          'alamat': alamat,
          'no_hp': nohp,
          'total_harga': total,
          'jumlah_barang': jumlah
        },
      );

      return response.data;
    } catch (error) {
      return null;
    }
  }
}
