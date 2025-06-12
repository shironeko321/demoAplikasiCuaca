import 'package:collection/collection.dart';
import 'package:demo/model/daily_weather_summary.dart';
import 'package:demo/model/weather_response.dart';
import 'package:demo/repository/weather_client.dart';
import 'package:demo/views/manage_location.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final WeatherClient _client;
  late Future<WeatherResponse> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _client = WeatherClient(Dio());
    _weatherFuture = _client.getWeatherByAdm4('17.04.04.2008');
  }

  Future<void> _refreshData() async {
    setState(() {
      _weatherFuture = _client.getWeatherByAdm4('17.04.04.2008');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // kerangka dasar halaman utama
      body: FutureBuilder<WeatherResponse>(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          // data mentah
          final response = snapshot.data!;

          // ambil data lokasi
          final location = response.lokasi.desa;

          // ambil data cuaca
          final now = DateTime.now();
          final allData = response.data.first.cuaca.expand((e) => e).toList();

          // Cari yang paling dekat dengan waktu sekarang
          allData.sort(
            (a, b) => (a.localDatetime.difference(
              now,
            )).abs().compareTo((b.localDatetime.difference(now)).abs()),
          );
          final currentWeather = allData.first;

          final minT = allData.reduce((a, b) => a.t < b.t ? a : b);
          final maxT = allData.reduce((a, b) => a.t > b.t ? a : b);

          // format tanggal
          final df = DateFormat('MMM d EEE'); // contoh: Jun 12 Thu
          final dateText = df.format(
            currentWeather.localDatetime,
          ); // "Jun 12 Thu"
          final minTemperature = '${minT.t}°C';
          final maxTemperature = '${maxT.t}°C';
          final formatted = '$dateText $minTemperature / $maxTemperature';

          // data hari ini
          final today = DateTime(now.year, now.month, now.day);
          // filter hanya data yang tanggalnya sama dengan hari ini
          final todayData =
              allData.where((item) {
                final localDate = DateTime.parse(item.localDatetime.toString());
                final itemDate = DateTime(
                  localDate.year,
                  localDate.month,
                  localDate.day,
                );
                return itemDate == today;
              }).toList();

          // Langkah 1: Group berdasarkan tanggal (tanpa jam)
          final grouped = groupBy(
            allData,
            (item) => DateFormat('yyyy-MM-dd').format(item.localDatetime),
          );

          // Langkah 2–4: Buat list dari data yang telah dikelompokkan
          final dailyWeatherList =
              grouped.entries.map((entry) {
                final date = entry.key;
                final items = entry.value;

                // Ambil suhu min dan max
                final minTemp = items
                    .map((e) => e.t)
                    .reduce((a, b) => a < b ? a : b);
                final maxTemp = items
                    .map((e) => e.t)
                    .reduce((a, b) => a > b ? a : b);

                // Ambil deskripsi cuaca yang paling sering muncul
                final description =
                    items
                        .map((e) => e.weatherDescEn)
                        .groupListsBy((desc) => desc)
                        .map((key, value) => MapEntry(key, value.length))
                        .entries
                        .sorted((a, b) => b.value.compareTo(a.value))
                        .first
                        .key;

                // Ambil ikon dari entri pertama (bisa dikembangkan pakai mayoritas juga)
                final icon = items.first.image;

                return DailyWeatherSummary(
                  date: date,
                  maxTemp: maxTemp,
                  minTemp: minTemp,
                  description: description,
                  icon: icon,
                );
              }).toList();

          return RefreshIndicator(
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
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
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                spacing: 16,
                                children: [
                                  Text(
                                    currentWeather.t.toString(),
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.displayLarge,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "°C",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                      Text(
                                        currentWeather.weatherDescEn,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                formatted,
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
                                  location,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.location_city,
                                        size: 24,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const ManageLocation(),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.more_vert,
                                        size: 24,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 10,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 20,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(todayData.length, (
                                index,
                              ) {
                                // menampilkan jam, ikon, dan suhu untuk tiap jam
                                final now = todayData[index];
                                final formattedTime = DateFormat(
                                  'HH:mm',
                                ).format(now.localDatetime);
                                final temperature = now.t;
                                return Column(
                                  spacing: 10,
                                  children: [
                                    Text(formattedTime), // jam
                                    SvgPicture.network(
                                      now.image,
                                      width: 28,
                                      height: 28,
                                      placeholderBuilder:
                                          (context) =>
                                              CircularProgressIndicator(),
                                    ),
                                    Text('$temperature C'), // suhu
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
                            children: List.generate(dailyWeatherList.length, (
                              index,
                            ) {
                              // menampilkan baris per hari

                              final item = dailyWeatherList[index];
                              final date = DateTime.parse(item.date);
                              final dayName = DateFormat.EEEE(
                                'en_US',
                              ).format(date);
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // text hari (misal: Today)
                                  Text(dayName),
                                  Row(
                                    spacing: 30,
                                    children: [
                                      SvgPicture.network(
                                        item.icon,
                                        width: 36,
                                        height: 36,
                                        placeholderBuilder:
                                            (context) =>
                                                CircularProgressIndicator(),
                                      ), // ikon cuaca harian
                                      Text(item.description), // deskripsi cuaca
                                      Text(
                                        "${item.minTemp} / ${item.maxTemp}",
                                      ), // suhu max / min
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
        },
      ),
    );
  }
}
