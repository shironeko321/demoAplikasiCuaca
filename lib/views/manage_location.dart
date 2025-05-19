import 'package:flutter/material.dart';

class ManageLocation extends StatelessWidget {
  const ManageLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // scaffold merupakan kerangka dasar dari tampilan yang mengikuti aturan material desain
    return Scaffold(
      // untuk mengatur nama halaman yang muncul, menu, hingga tombol kembali kehalaman sebelumnya
      appBar: AppBar(
        title: Text("Manage Cities", style: textTheme.titleLarge),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit_square, size: 24))],
      ),
      body: Container(
        height: double.infinity,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          // arah dari scrollnya apakah kiri ke kanan ataukah atas ke bawah
          scrollDirection: Axis.vertical,
          child: Column(
            // Column tidak punya property spacing, pakai SizedBox untuk jarak antar item
            children: List.generate(3, (index) {
              // tampilan kota
              return Padding(
                padding: const EdgeInsets.only(bottom: 8), // memberikan jarak antar container
                child: Container(
                  padding: const EdgeInsets.all(24),

                  // dekorasi container dimana ada warna dan border radius
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer, // warna background dari theme
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRUO2xxx9Pk_cNKz2hKb-RDPZOgsymq4i0QA&s",
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(
                          alpha: 0.2,
                        ), // kalau mau agak gelap, bisa diatur opacity-nya
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Icon(
                          Icons.location_city,
                          size: Theme.of(context).textTheme.displayMedium?.fontSize,
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: .3),
                        ),
                      ),

                      Column(
                        // membuat semua item akan jadi rata kanan
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            // membuat widget di dalamnya menjadi berjarak berjauhan satu sama lain
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 8,
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
                                    style: textTheme.titleMedium,
                                  ),
                                  if (index == 0)
                                    Icon(Icons.location_on, size: 16, color: colorScheme.onPrimary),
                                ],
                              ),
                              // text di kanan untuk suhu
                            ],
                          ),

                          // text dibawah tulisan suhu
                          Text("28°c", style: textTheme.titleMedium),
                          Text('Thunderstorm', style: textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
