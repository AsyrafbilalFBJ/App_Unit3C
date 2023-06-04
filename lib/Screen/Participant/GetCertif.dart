import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Participant/Navigator.dart';

class GetCertif extends StatefulWidget {
  final dynamic dataKelas;

  const GetCertif({super.key, required this.dataKelas});

  @override
  State<GetCertif> createState() => _ModulState();
}

class _ModulState extends State<GetCertif> {
  DatabaseReference _databaseAcc = FirebaseDatabase.instance.ref('Account');
  late List<dynamic> _items;

  @override
  void initState() {
    super.initState();
    _items = [];
    _databaseAcc = FirebaseDatabase.instance.ref().child('Account');

    _databaseAcc
        .orderByChild('uid')
        .equalTo(widget.dataKelas['uid'])
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          // Retrieve the text data and convert it to a list of strings
          Map<dynamic, dynamic>? dataMap =
              event.snapshot.value as Map<dynamic, dynamic>?;

          _items = dataMap?.values.toList() ?? [];
        });
      }
    });
  }

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
                  child: Container(
                    child: Image.asset('assets/Left.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
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
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7, top: 25),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Certificate',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                        textAlign: TextAlign.center, // Center-align the text
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Thanks for finishing the class.             \nHere is your Certificate',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/certif.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 20),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0,
                              16.0, 0.0), // Ubah padding konten dialog
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Ubah radius border dialog
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Certificate Downloaded',
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 32, 32),
                                  ),
                                ),
                              ),
                              Image.asset('assets/jempol.png')
                            ],
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Check your download folder.',
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 32, 32),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PNavigator(
                                            name: _items[0]['name'],
                                            uid: myData['uid'])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  width: double.infinity,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromARGB(255, 55, 53, 53),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Home',
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 191, 188, 188),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 54, 52, 52),
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
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Download',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 213, 211, 211),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 8, bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Notes',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 27, 26, 26),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 700,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Hallo User!, terima kasih telah sabar menunggu. Kami membutuhkan waktu untuk bisa memberikan feedback sekomprehensif mungkin kepada setiap peserta kelas. Dalam kesempatan ini ada 4 (empat) hal yang ingin kami sampaikan. Pertama, kami ingin mengucapkan selamat! Karena kamu telah menyelesaikan tugas submission dari kelas Belajar Dasar Pemrograman Web. Jangan lihat bintang yang kamu raih, tapi lihat kemajuan yang sudah kamu capai. Ingat semua expert dahulu pemula. Kedua, meskipun kamu telah menguasai tiga pilar dasar dalam membangun website, yakni HTML, CSS, dan JavaScript, mohon jangan berpuas diri. Mumpung masih hangat semangatnya langsung lanjut kelas selanjutnya yaitu Belajar Fundamental Front-End Web Development. Supaya lebih semangat belajarnya, silakan baca laporan dari Glassdoor yang dimuat oleh CNBC yang menyatakan bahwa Front End Engineer adalah pekerjaaan teknis (tech job) terbaik di tahun 2020. Dicoding telah merancang alur belajar Front-End Web Developer dengan standar global. Ketiga, beberapa lulusan tidak tahu mereka memiliki akses kelas selamanya. Sebagai informasi kelas Dicoding selalu update sehingga memiliki perbedaan minimal 30% dari sejak kelas dirilis. Silakan mampir kembali untuk melihat materi saat kamu membutuhkan update. Keempat, karena sudah praktik langsung maka kamu sudah menguasai ilmu kelas dasar ini antara 75-90%. Salah satu cara agar meningkatkan penguasaan ilmu agar bisa lebih maksimal (>90%) adalah dengan memperbanyak latihan atau mengajarkan ilmu kepada orang lain. Maka dari itu untuk mengasah kemampuan dan membuat ilmu kamu lebih berkah serta bermanfaat, silakan berkunjung ke forum diskusi kelas untuk membantu kawan-kawan kita yang saat ini masih berjuang. ',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
