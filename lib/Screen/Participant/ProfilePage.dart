import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Login/LoginAndri.dart';
import 'CategoryPage.dart';
import 'ChartPage.dart';
import 'PageOtp.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> judulItems = [
    'Judul Item 1',
    'Judul Item 2',
    'Judul Item 3',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 30),
            alignment: Alignment.center,
            child: const Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 167, 163, 163),
                      image: const DecorationImage(
                        image: AssetImage('assets/Vector.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                        Text(
                          'Participant',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _auth.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Text(
                                'Logout',
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color:
                                        Color.fromARGB(255, 31, 30, 30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                        color:
                            const Color.fromARGB(255, 117, 116, 116).withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: judulItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigasi ke halaman yang diinginkan sesuai dengan indeks item
                          if (index == 0) {
                            // Navigasi ke halaman Profile
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CategoryPage()),
                            );
                          } else if (index == 1) {
                            // Navigasi ke halaman Akun
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChartPage()),
                            );
                          } else if (index == 2) {
                            // Navigasi ke halaman Ubah Password
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtpPage()),
                            );
                          }
                          // Tambahkan penanganan navigasi untuk item lainnya sesuai kebutuhan
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(judulItems[index]),
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ))),
          Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              'App Version 1.1.1',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          )
        ],
      ),
    ]));
  }
}
