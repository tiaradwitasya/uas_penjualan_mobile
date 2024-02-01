import 'dart:ffi';
import 'package:aplikasi_penjualan/models/post_transaksi_model.dart';
import 'package:aplikasi_penjualan/service/api_service.dart';
import 'package:aplikasi_penjualan/ui/home_page.dart';
import 'package:flutter/material.dart';

class FormTransaksiScreen extends StatefulWidget {
  final data;
  const FormTransaksiScreen({super.key, this.data});

  @override
  State<FormTransaksiScreen> createState() => _FormTransaksiScreenState();
}

class _FormTransaksiScreenState extends State<FormTransaksiScreen> {
  final apiService = ApiService();
  final TextEditingController _namaPelanggan = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _noHp = TextEditingController();

  var jumlah = 1;
  var total = 0;

  @override
  void initState() {
    super.initState();
    total = int.parse(widget.data.harga);
  }

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Pelanggan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextField(
                    controller: _namaPelanggan,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No Hp",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextField(
                    controller: _noHp,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextField(
                    controller: _alamat,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Barang Yang Di Beli",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Barang",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "${widget.data.nama}",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harga barang",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "${formatRupiah(int.parse(widget.data.harga))}",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jumlah Barang",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (jumlah > 1) {
                          setState(() {
                            jumlah -= 1;
                            total = int.parse(widget.data.harga) * jumlah;
                          });
                        }
                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(child: Center(child: Text("${jumlah}"))),
                  Container(
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          jumlah += 1;
                          total = int.parse(widget.data.harga) * jumlah;
                        });
                      },
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${formatRupiah(total)}",
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_namaPelanggan.text == "" ||
                            _alamat.text == "" ||
                            _noHp.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Lengakapi Data Anda Dahulu!')));
                          return;
                        }
                        var res = await apiService.sendOrder(
                          int.parse(widget.data.id),
                          _namaPelanggan.text.toString(),
                          _alamat.text.toString(),
                          _noHp.text.toString(),
                          total,
                          jumlah,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Data Pesanan berhasil Order')));

                        // Setelah berhasil melakukan post data arahkan halaman ke halaman HomePage
                        // dengan isi data yang baru
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                            (route) => false);
                      },
                      child: Text(
                        "Beli",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
