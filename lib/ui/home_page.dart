import 'package:flutter/material.dart';
import 'package:aplikasi_penjualan/models/get_barang_model.dart';
import 'package:aplikasi_penjualan/response/getbarang_response.dart';
import 'package:aplikasi_penjualan/ui/form_transaksi.dart';
import '../service/api_service.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchbarang = TextEditingController();
  final apiService = ApiService();
  late Future<GetBarangResponse?> _future;

  @override
  void initState() {
    super.initState();
    _future = apiService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of post'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchbarang,
                    decoration: InputDecoration(
                      labelText: 'Search...',
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Update future dengan hasil pencarian baru
                      _future =
                          apiService.getPosts(searchQuery: _searchbarang.text);
                    });
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
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
                  GetBarangResponse getbarangresponse = snapshot.data;
                  List<GetBarangModel> listBarang = getbarangresponse.listPost;
                  return ListView.builder(
                    itemCount: listBarang.length,
                    itemBuilder: (context, index) {
                      GetBarangModel postModel = listBarang[index];
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
                                            FormTransaksiScreen(
                                          data: postModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Beli"),
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
