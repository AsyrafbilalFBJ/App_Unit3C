import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ModulePage.dart';
import 'Navigator.dart';
import 'ChartPage.dart';
import 'PageOtp.dart';

class PageClass extends StatefulWidget {
  final dynamic dataKelas;

  const PageClass({Key? key, required this.dataKelas}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<PageClass> {
  List<Reward> rewards = [
    Reward(
      title: 'Level Beginner',
      image: 'assets/penanda.png',
    ),
    Reward(
      title: 'Level Mahir',
      image: 'assets/penanda.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    dynamic myData = widget.dataKelas;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: <Widget>[
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    child: Container(
                      child: Image.asset('assets/Left.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        myData['title'],
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                child: Image.asset(
                  '${myData['logo']}',
                  width: 170,
                  height: 170,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 31, 30, 30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 117, 116, 116)
                            .withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      myData['description'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 31, 30, 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Modules',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 31, 30, 30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 117, 116, 116)
                                .withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: rewards.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Modul(dataKelas: myData)),
                                  );
                                  // Navigasi ke halaman yang diinginkan sesuai dengan indeks item
                                  // if (index == 0) {
                                  //   // Navigasi ke halaman Profile
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const Modul()),
                                  //   );
                                  // } else if (index == 1) {
                                  //   // Navigasi ke halaman Akun
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const ChartPage()),
                                  //   );
                                  // } else if (index == 2) {
                                  //   // Navigasi ke halaman Ubah Password
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const OtpPage()),
                                  //   );
                                  // }
                                  // Tambahkan penanganan navigasi untuk item lainnya sesuai kebutuhan
                                },
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Text(
                                              '${index + 1}. ${rewards[index].title}'),
                                          const SizedBox(
                                              width:
                                                  10), // Jarak antara judul dan gambar
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              width: 40,
                                              height: 40,
                                              child: Image.asset(
                                                  rewards[index].image),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ))),
            ],
          )
        ],
      ),
    );
  }
}

class Reward {
  final String title;
  final String image;

  Reward({
    required this.title,
    required this.image,
  });
}
