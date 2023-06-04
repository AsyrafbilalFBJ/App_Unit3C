import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'GetCertif.dart';
import 'PagesClass.dart';

import 'package:firebase_database/firebase_database.dart';

class Progres extends StatefulWidget {
  final dynamic name;
  final dynamic uid;

  const Progres({super.key, required this.name, required this.uid});

  @override
  _ProgresPageState createState() => _ProgresPageState();
}

class _ProgresPageState extends State<Progres> {
  DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('Transaction');
  late List<dynamic> _items;

  @override
  void initState() {
    super.initState();
    _items = [];
    _database = FirebaseDatabase.instance.reference().child('Transaction');

    _database
        .orderByChild('uid')
        .equalTo(widget.uid)
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

  // void getDataByUid(String uid) {
  //   _database
  //       .orderByChild('uid')
  //       .equalTo(uid)
  //       .once()
  //       .then((DatabaseEvent event) {
  //     if (event.snapshot.value != null) {
  //       setState(() {
  //         _items = event.snapshot?.value as List<dynamic>;
  //       });
  //     } else {
  //       // No transactions found with the specified uid
  //       print('No transactions found for uid: $uid');
  //     }
  //   }).catchError((error) {
  //     print('Error: $error');
  //   });
  // }

  // void getDataByUid(String uid) {
  //   _database
  //       .orderByChild('uid')
  //       .equalTo(uid)
  //       .once()
  //       .then((DatabaseEvent event) {
  //     if (event.snapshot.value != null) {
  //       Map<dynamic, dynamic>? transactions = event.snapshot?.value as Map<dynamic, dynamic>?;
  //       transactions!.forEach((key, value) {
  //         // Access the transaction objects here
  //         print('Key: $key');
  //         print('Transaction: $value');
  //       });
  //     } else {
  //       // No transactions found with the specified uid
  //       print('No transactions found for uid: $uid');
  //     }
  //   } as FutureOr Function(DatabaseEvent value)).catchError((error) {
  //     print('Error: $error');
  //   });
  // }

  // void fetchData() {
  //   DatabaseReference transactionRef =
  //       FirebaseDatabase.instance.reference().child('Transaction');
  //   DatabaseReference classesRef =
  //       FirebaseDatabase.instance.reference().child('classes');

  //   transactionRef.once().then((DataSnapshot transactionSnapshot) {
  //         if (transactionSnapshot.value != null) {
  //           Map<dynamic, dynamic> transactionData =
  //               transactionSnapshot.value as Map<dynamic, dynamic>;
  //           transactionData.forEach((transactionKey, transactionValue) {
  //             String uid = transactionValue['id_kelas'];

  //             classesRef.child(uid).once().then((DataSnapshot classesSnapshot) {
  //                   if (classesSnapshot.value != null) {
  //                     Map<dynamic, dynamic> classesData =
  //                         classesSnapshot.value as Map<dynamic, dynamic>;
  //                     String title = classesData['title'];
  //                     String description = classesData['description'];
  //                     String logo = classesData['logo'];
  //                     String level = classesData['level'];
  //                     int registered = classesData['registered'];
  //                     double rate = classesData['rate'];
  //                     String color = classesData['color'];
  //                     String uid = classesData['uid'];

  //                     // Add the data to the list
  //                     _items.add({
  //                       'title': title,
  //                       'description': description,
  //                       'logo': logo,
  //                       'level': level,
  //                       'registered': registered,
  //                       'rate': rate,
  //                       'color': color,
  //                       'uid': uid,
  //                     } as dynamic);
  //                   }
  //                 } as FutureOr Function(DatabaseEvent value));
  //           });
  //         }
  //       } as FutureOr Function(DatabaseEvent value));
  // }

  // double _rating = 3.0;

  // List<Recommendation> recommendations = [
  //   Recommendation(
  //     image: 'assets/java.png',
  //     title: 'Java Application',
  //     level: 'Level Beginner',
  //     registered: '13.252 Registered',
  //     price: 'Rp. 99.000',
  //     trash: 'assets/Trash.png',
  //     icright: 'assets/icon _right.png',
  //   ),
  //   Recommendation(
  //     image: 'assets/c.png',
  //     title: 'C Fundamental',
  //     level: 'Level Intermediate',
  //     registered: '9.876 Registered',
  //     price: 'Rp. 99.000',
  //     trash: 'assets/Trash.png',
  //     icright: 'assets/icon _right.png',
  //   ),
  //   Recommendation(
  //     image: 'assets/js.png',
  //     title: 'JavaScript Project',
  //     level: 'Level Advanced',
  //     registered: '7.543 Registered',
  //     price: 'Rp. 99.000',
  //     trash: 'assets/Trash.png',
  //     icright: 'assets/icon _right.png',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                alignment: Alignment.center,
                child: const Text(
                  'Progres',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 223, 217, 217),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(1.5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search For Product...",
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman yang diinginkan sesuai dengan indeks item
                      // if (_items[index] == 0) {
                      // Navigasi ke halaman Profile
                      if (_items[index]['status'] == 'dipelajari') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PageClass(dataKelas: _items[index])),
                        );
                      } else if (_items[index]['status'] == 'selesai') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetCertif(dataKelas: _items[index])),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PageClass(dataKelas: _items[index])),
                        );
                      }

                      // } else if (_items[index] == 1) {
                      //   // Navigasi ke halaman Akun
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ChartPage()),
                      //   );
                      // } else if (_items[index] == 2) {
                      //   // Navigasi ke halaman Ubah Password
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => OtpPage()),
                      //   );
                      // }
                      // Tambahkan penanganan navigasi untuk item lainnya sesuai kebutuhan
                    },
                    child: buildRecommendationItem(_items[index]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRecommendationItem(dynamic data) {
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
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('${data['logo']}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title'],
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Status: ${data['status']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 3),
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
                    child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/icon _right.png',
                          height: 100,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Recommendation {
  final String image;
  final String title;
  final String level;
  final String registered;
  final String price;
  final String trash;
  final String icright;

  Recommendation({
    required this.image,
    required this.title,
    required this.level,
    required this.registered,
    required this.price,
    required this.trash,
    required this.icright,
  });
}

class DetailPage extends StatelessWidget {
  final Recommendation recommendation;

  const DetailPage({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(recommendation.image),
            const SizedBox(height: 20),
            Text(
              recommendation.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              recommendation.level,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              recommendation.registered,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
