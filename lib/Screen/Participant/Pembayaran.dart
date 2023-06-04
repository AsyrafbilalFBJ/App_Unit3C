import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'PagesClass.dart';
// import 'PageOtp.dart/';

import 'package:firebase_database/firebase_database.dart';

class Paid extends StatefulWidget {
  final dynamic dataKelas;
  final dynamic user_id;

  const Paid({super.key, required this.dataKelas, required this.user_id});
  // const Paid({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Paid> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref('classes');
  final DatabaseReference _databaseTransaction =
      FirebaseDatabase.instance.ref('Transaction');
  final List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _database.onChildAdded.listen((event) {
      setState(() {
        _items.add(event.snapshot.value.toString());
      });
    });
  }

  // double _rating = 3.0;

  // List<Map<String, String>> containerContents = [
  //   {
  //     'title': 'Certificate 1',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 1.',
  //     'imagePath': 'assets/Gcerti.png',
  //   },
  //   {
  //     'title': 'Certificate 2',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 2.',
  //     'imagePath': 'assets/Right.png',
  //   },
  //   {
  //     'title': 'Certificate 3',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 3.',
  //     'imagePath': 'assets/Left.png',
  //   },
  // ];
  // List<Map<String, String>> containerContents2 = [
  //   {
  //     'title': 'Certificate 1',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 1.',
  //     'imagePath': 'assets/Gcerti.png',
  //   },
  //   {
  //     'title': 'Certificate 2',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 2.',
  //     'imagePath': 'assets/certiCode.png',
  //   },
  //   {
  //     'title': 'Certificate 3',
  //     'description':
  //         'Earn an industry standard certificate upon completion of this class 3.',
  //     'imagePath': 'assets/Left.png',
  //   },
  // ];

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
              )
            ],
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Information',
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
              builRegistration(),
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
                    'Reward',
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
              SizedBox(
                height: 200,
                child: CarouselSlider.builder(
                  itemCount: myData.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    String title = myData['title']!;
                    String description = myData['description']!;
                    String imagePath = myData['logo']!;

                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 206, 206, 205),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 140,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'FeedBack',
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
              SizedBox(
                height: 200,
                child: CarouselSlider.builder(
                  itemCount: myData.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    String title = myData['title']!;
                    String description = myData['description']!;
                    String imagePath = myData['logo']!;

                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 206, 206, 205),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 140,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              ),

              const SizedBox(
                height: 100,
              )
              // buildReward(rewards[index]),
            ],
          )
          // child: buildFeedback(recommendations[index]),
          //         );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget builRegistration() {
    dynamic myData = widget.dataKelas;
    dynamic mydataUserId = widget.user_id;
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, right: 13, bottom: 8.0, left: 13),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 117, 116, 116).withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: myData['rate'],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 1,
                              itemSize: 30,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  myData['rate'] = rating;
                                });
                              },
                            ),
                            Text(
                              '${myData['rate']}',
                              style: const TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 79, 78, 78),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Level: ${myData['level']}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rp ${myData['price'].toString()}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 81, 80, 80),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 8.0, right: 20.0, bottom: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0,
                                    16.0,
                                    16.0,
                                    0.0), // Ubah padding konten dialog
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Ubah radius border dialog
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add cart Success',
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 33, 32, 32),
                                        ),
                                      ),
                                    ),
                                    Image.asset('assets/centang.png')
                                  ],
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Class Added to Cart',
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 33, 32, 32),
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
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                        width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color.fromARGB(
                                              255, 55, 53, 53),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Ok',
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
                        child: Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 188, 184, 184),
                          ),
                          child: Center(
                            child: Text(
                              'Add Chart',
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 31, 30, 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 20.0, bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0,
                                    16.0,
                                    16.0,
                                    0.0), // Ubah padding konten dialog
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Ubah radius border dialog
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Detail',
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 53, 52, 52),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      // Penambahan garis bawah
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ],
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Class'),
                                    Text(myData['title']),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text('Level'),
                                    Text(myData['level']),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text('Total'),
                                    Text('Rp.${myData['price'].toString()}'),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      registerNow(
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
                                        mydataUserId,
                                      );
                                      addClassRegistered(
                                          myData['title'],
                                          myData['description'],
                                          myData['category'],
                                          myData['logo'],
                                          myData['level'],
                                          myData['registered'],
                                          myData['rate'],
                                          myData['color'],
                                          myData['price'],
                                          myData['id_kelas']);
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext) {
                                            return AlertDialog(
                                              contentPadding: const EdgeInsets
                                                      .fromLTRB(
                                                  16.0,
                                                  16.0,
                                                  16.0,
                                                  0.0), // Ubah padding konten dialog
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    15), // Ubah radius border dialog
                                              ),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Payment Success',
                                                    style:
                                                        GoogleFonts.quicksand(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 33, 32, 32),
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                      'assets/centang.png')
                                                ],
                                              ),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Thanks for your register',
                                                    style:
                                                        GoogleFonts.quicksand(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 33, 32, 32),
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
                                                  // onPressed: () {
                                                  //   Navigator.of(context).pop();
                                                  // },
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PageClass(
                                                                  dataKelas:
                                                                      myData)),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 55, 53, 53),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Course Now',
                                                          style: GoogleFonts
                                                              .quicksand(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      191,
                                                                      188,
                                                                      188),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                            ;
                                          });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                        width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color.fromARGB(
                                              255, 55, 53, 53),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Pay',
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
                        child: Container(
                          width: 130,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                          child: Center(
                            child: Text(
                              'Register Now',
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 220, 218, 218),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerNow(
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
      String idUser) async {
    DatabaseReference transactionItem =
        FirebaseDatabase.instance.ref().child('Transaction');
    transactionItem = _databaseTransaction.push();
    await _databaseTransaction.child(transactionItem.key.toString()).set({
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
      'status': 'dipelajari',
      'uid': idUser,
      'id_transaction': transactionItem.key.toString()
      // 'uid': _database.push().key as String
    });
  }

  Future<void> addClassRegistered(
      String title,
      String description,
      String category,
      String logo,
      String level,
      int registered,
      double rate,
      String color,
      int price,
      String idKelas) async {
    await _database.child(idKelas).set({
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
    });
  }

  // Widget buildFeedback(Recommendation recommendation) {
  //   dynamic myData = widget.dataKelas;
  //   return Padding(
  //     padding:
  //         const EdgeInsets.only(top: 8.0, right: 13, bottom: 8.0, left: 13),
  //     child: Container(
  //       width: double.infinity,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Color.fromARGB(255, 117, 116, 116).withOpacity(0.5),
  //             spreadRadius: 4,
  //             blurRadius: 5,
  //             offset: Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         children: [
  //           Container(
  //             child: Row(
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         recommendation.level +
  //                             '. ' +
  //                             recommendation.registered,
  //                         style: TextStyle(color: Colors.grey),
  //                       ),
  //                       SizedBox(height: 3),
  //                       Row(
  //                         children: [
  //                           RatingBar.builder(
  //                             initialRating: _rating,
  //                             minRating: 1,
  //                             direction: Axis.horizontal,
  //                             allowHalfRating: true,
  //                             itemCount: 1,
  //                             itemSize: 25,
  //                             itemPadding:
  //                                 EdgeInsets.symmetric(horizontal: 4.0),
  //                             itemBuilder: (context, _) => Icon(
  //                               Icons.star,
  //                               color: Colors.amber,
  //                             ),
  //                             onRatingUpdate: (rating) {
  //                               setState(() {
  //                                 _rating = rating;
  //                               });
  //                             },
  //                           ),
  //                           Text(
  //                             '$_rating',
  //                             style: TextStyle(
  //                                 fontSize: 14,
  //                                 color: Colors.grey,
  //                                 fontWeight: FontWeight.bold),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// class CustomDialog2 extends StatelessWidget {
//   @override
Widget CustomDialog2(BuildContext context) {
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
          'Payment Success',
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 33, 32, 32),
            ),
          ),
        ),
        Image.asset('assets/centang.png')
      ],
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Thanks for your register',
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
        // onPressed: () {
        //   Navigator.of(context).pop();
        // },
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const PageClass(dataKelas: context)),
          // );
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
                'Course Now',
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
// }
