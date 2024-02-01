import 'package:aplikasi_penjualan/models/myorder_model.dart';
import 'package:aplikasi_penjualan/response/myorder_response.dart';
import 'package:aplikasi_penjualan/service/api_service.dart';
import 'package:aplikasi_penjualan/ui/home_page.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final apiService = ApiService();

  String formatRupiah(int value) {
    String result = value.toString();
    String temp = '';
    int count = 0;
    for (int i = result.length - 1; i >= 0; i--) {
      temp += result[i];
      count++;
      if (count == 3 && i != 0) {
        temp += '.';
        count = 0;
      }
    }
    String formatted = '';
    for (int i = temp.length - 1; i >= 0; i--) {
      formatted += temp[i];
    }
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: apiService.getMyOrder(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  MyOrderResponse getorder = snapshot.data;
                  List<getMyOrderModel> listBarang = getorder.listPost;
                  return ListView.builder(
                    itemCount: listBarang.length,
                    itemBuilder: (context, index) {
                      getMyOrderModel postModel = listBarang[index];
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
                                      "Pesanan : ${postModel.nama_pelanggan.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      postModel.nama_barang.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${formatRupiah(int.parse(postModel.total_harga!))}",
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
                                  onPressed: () async {
                                    var res = apiService.DeleteTransaksi(
                                        postModel.id!);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Data Transaksi berhasil Hapus')));

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()),
                                        (route) => false);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
