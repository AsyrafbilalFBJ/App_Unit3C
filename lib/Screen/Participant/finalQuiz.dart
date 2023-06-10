import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GetCertif.dart';

class FinalQuiz extends StatefulWidget {
  final dynamic dataKelas;

  const FinalQuiz({super.key, required this.dataKelas});

  @override
  State<FinalQuiz> createState() => _ModulState();
}

class _ModulState extends State<FinalQuiz> {
  final DatabaseReference _databaseTransaction =
      FirebaseDatabase.instance.ref('Transaction');

  double _rating = 3.0;
  int? selectedValue;
  List<String> options = ['Pilihan 1', 'Pilihan 2', 'Pilihan 3'];

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
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Rate this class',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: _rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 30,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          _rating = rating;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color.fromARGB(
                                          255, 183, 183, 183),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Comment',
                                          hintStyle: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
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
                                        'Rate',
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext) {
                                        return CustomDialog2(
                                            dataKelas: myData,
                                            dbTrans: _databaseTransaction);
                                      });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      child: Image.asset('assets/Right.png'),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7, top: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Quiz Result',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 31, 30, 30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7, top: 35),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '100',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                      ),
                      Text(
                        'Anda berhasil menyelesaikan quiz \n             dengan sempurna',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 500,
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
                          'Question - 1 of 1',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Komentar pada program dalam Java dapat menggunakan perintah…',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RadioListTile(
                            value: index,
                            groupValue: selectedValue,
                            title: Text(
                              options[index],
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 31, 30, 30),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          );
                        },
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

class CustomDialog2 extends StatelessWidget {
  final dynamic dataKelas;
  final dynamic dbTrans;
  const CustomDialog2(
      {super.key, required this.dataKelas, required this.dbTrans});

  @override
  Widget build(BuildContext context) {
    dynamic myData = dataKelas;
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(
          16.0, 16.0, 16.0, 0.0), // Ubah padding konten dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Ubah radius border dialog
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Thanks for rate this class',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 33, 32, 32),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/centang.png'),
          const SizedBox(
            height: 10,
          )
        ],
      ),
      actions: [
        TextButton(
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
          onPressed: () {
            //declare variable
            _changeStatus(
                myData['title'],
                myData['description'],
                myData['category'],
                myData['logo'],
                myData['level'],
                myData['registered'],
                myData['rate'],
                myData['color'],
                myData['price'],
                myData['id_kelas'],
                myData['uid'],
                myData['status'],
                myData['id_transaction']
            );
            String idKelas = myData['id_kelas'];
            String rate = myData['rate'];
            _updateRate(idKelas, rate as double);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GetCertif(dataKelas: myData)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 55, 53, 53),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Get Certificate',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 191, 188, 188),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _changeStatus(
      String title,
      String description,
      String category,
      String logo,
      String level,
      int registered,
      double rate,
      String color,
      int price,
      String idKelas,
      String idUser,
      String status,
      String id_transaction) async {
    await dbTrans.child(id_transaction).set({
      'title': title,
      'description': description,
      'category': category,
      'logo': logo,
      'level': level,
      'registered': registered + 1,
      'rate': rate,
      'color': color,
      'price': price,
      'id_kelas': idKelas,
      'status': 'selesai',
      'uid': idUser,
      'id_transaction': id_transaction
      // 'uid': _database.push().key as String
    });
  }

  Future<void> _updateRate(String idKelas, double rate) async {
    DatabaseReference _dbclass =
        FirebaseDatabase.instance.ref().child('classes/$idKelas');

    _dbclass.update({
      'rate': rate,
    });

    }
}
