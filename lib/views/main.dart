import 'package:demo/views/manage_location.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // kerangka dasar halaman utama
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // bagian app bar atas (nama lokasi dan 2 tombol di kanan)
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // nama lokasi
                  Text("Pangkalalang", style: TextStyle(fontSize: 20)),
                  Row(
                    spacing:
                        12, // memberikan jarak antar tombol (salah di Flutter, Row tidak punya spacing)
                    children: [
                      // tombol menuju halaman Manage Location
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => const ManageLocation(),
                            ),
                          );
                        },
                        icon: Icon(Icons.location_city, size: 24),
                      ),
                      // tombol more options (belum ada aksi)
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 24)),
                    ],
                  ),
                ],
              ),
            ),

            // bagian pemisah kosong (jarak antara header dan cuaca utama)
            Container(height: 200),

            // bagian cuaca utama (suhu dan deskripsi)
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                spacing:
                    10, // memberikan jarak antara suhu dan deskripsi (Row juga tidak punya spacing)
                children: [
                  // suhu utama
                  Text("28", style: TextStyle(fontSize: 72)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // satuan suhu
                      Text("°C", style: TextStyle(fontSize: 24)),
                      // deskripsi cuaca
                      Text("Mostly Cloudy", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ),

            // bagian text tanggal dan suhu minimum maksimum
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Apr 17 Thu 29c / 26c', style: TextStyle(fontSize: 16)),
            ),

            // bagian list cuaca per jam
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20, // memberikan jarak antar item jam (Row tidak support spacing)
                  children: List.generate(20, (index) {
                    // menampilkan jam, ikon, dan suhu untuk tiap jam
                    return Column(
                      spacing:
                          10, // memberikan jarak antar item di kolom (Column tidak support spacing)
                      children: [
                        Text("1$index:00"), // jam
                        Icon(Icons.cloud, size: 28), // ikon cuaca
                        Text('$index c'), // suhu
                      ],
                    );
                  }),
                ),
              ),
            ),

            // bagian list cuaca harian
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 20, // memberikan jarak antar item hari (Column tidak support spacing)
                children: List.generate(7, (index) {
                  // menampilkan baris per hari
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // text hari (misal: Today)
                      Text("Today"),
                      Row(
                        spacing:
                            30, // memberikan jarak antar ikon dan teks (Row tidak support spacing)
                        children: [
                          Icon(Icons.cloudy_snowing, size: 36), // ikon cuaca harian
                          Text("Mostly Cloudy"), // deskripsi cuaca
                          Text("29 / 26"), // suhu max / min
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
