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
          children: [
            // bagian pemisah kosong (jarak antara header dan cuaca utama)
            SizedBox(
              height: 450,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // gambar di background
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe_OlHEe2L-0VtexCxjIV5tc0dLor3wd57Yg&s",
                    fit: BoxFit.cover,
                  ),

                  // background pemisah antara cuaca utama dengan cuaca yang dibawah
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Theme.of(context).colorScheme.onPrimaryContainer,
                        ],
                      ),
                    ),
                  ),

                  // text utama suhu
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 300),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          spacing: 16,
                          children: [
                            Text("28", style: Theme.of(context).textTheme.displayLarge),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("°C", style: Theme.of(context).textTheme.titleMedium),
                                Text(
                                  "Mostly Cloudy",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Apr 17 Thu 29c / 26c',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),

                  // bagian app bar atas (nama lokasi dan 2 tombol di kanan)
                  // appbar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pangkalalang",
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.location_city,
                                  size: 24,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const ManageLocation()),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 24,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                onPressed: () {
                                  // aksi tombol more options
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              child: Column(
                children: [
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
                              Icon(
                                Icons.cloud,
                                size: 28,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ), // ikon cuaca
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
                      spacing:
                          20, // memberikan jarak antar item hari (Column tidak support spacing)
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
                                Icon(
                                  Icons.cloudy_snowing,
                                  size: 36,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ), // ikon cuaca harian
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
          ],
        ),
      ),
    );
  }
}
