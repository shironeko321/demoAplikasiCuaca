import 'package:flutter/material.dart';

class ManageLocation extends StatelessWidget {
  const ManageLocation({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold merupakan kerangka dasar dari tampilan yang mengikuti aturan material desain
    return Scaffold(
      // untuk mengatur nama halaman yang muncul, menu, hingga tombol kembali kehalaman sebelumnya
      appBar: AppBar(
        title: Text("Manage Cities"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit_square, size: 24))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        // arah dari scrollnya apakah kiri ke kanan ataukah atas ke bawah
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 8,

          // digunakan untuk membuat list kota sebanyak 3
          children: List.generate(3, (index) {
            // tampilan kota
            return Container(
              padding: EdgeInsets.all(24),

              // dekorasi container dimana ada warna dan border radius
              decoration: BoxDecoration(
                color: Colors.black,

                // border radius itu untuk membuat sudut menjadi halus atau pun lancip
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                // membuat semua item akan jadi rata kanan
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  Row(
                    // membuat widget di dalamnya menjadi berjarak berjauhan satu sama lain
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // memberijan jarak antar item di dalamnya dengan ukuran pasti
                        spacing: 8,
                        children: [
                          // nama kota dan icon untuk menandakan kota saat ini
                          Text(
                            "Pangkal Lalang",

                            // untuk modifikasi tulisan
                            // font size untuk ukuran font dan color untuk warna
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(Icons.location_on, size: 16, color: Colors.white),
                        ],
                      ),

                      // text di kanan untuk suhu
                      Text("28°c", style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),

                  // text dibawah tulisan suhu
                  Text('Thunderstrom', style: TextStyle(color: Colors.white)),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
