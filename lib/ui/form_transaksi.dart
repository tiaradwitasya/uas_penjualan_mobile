import 'package:flutter/material.dart';


class FormTransaksiScreen extends StatefulWidget {
  final data;
  const FormTransaksiScreen({super.key,this.data});

  @override
  State<FormTransaksiScreen> createState() => _FormTransaksiScreenState();
}

class _FormTransaksiScreenState extends State<FormTransaksiScreen> {
  final TextEditingController _namaPelanggan = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _noHp = TextEditingController();

  var jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
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
                    "${widget.data.harga}",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
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
                        setState(() {
                          jumlah -=1;
                        });
                      },
                      child: Text(
                        "-",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(child: Center(child: Text("${jumlah}"))),
                  Container(
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          jumlah +=1;
                        });
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                      ),
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
                      onPressed: () {
                        
                      },
                      child: Text(
                        "Beli",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
