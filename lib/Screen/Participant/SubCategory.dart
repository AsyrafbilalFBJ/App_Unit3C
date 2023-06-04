import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pembayaran.dart';

class Classes extends StatefulWidget {
  final dynamic category;
  final dynamic user_id;

  const Classes({super.key, required this.category, required this.user_id});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Classes> {
  DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('classes');
  late List<dynamic> _items;

  @override
  void initState() {
    super.initState();
    _items = [];
    _database = FirebaseDatabase.instance.reference().child('classes');

    _database
        .orderByChild('category')
        .equalTo(widget.category['Category_title'])
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

  final double _rating = 3.0;

  List<Recommendation> recommendations = [
    Recommendation(
      image: 'assets/java.png',
      title: 'Java Application',
      level: 'Level Beginner',
      registered: '13.252 Registered',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
    Recommendation(
      image: 'assets/c.png',
      title: 'C Fundamental',
      level: 'Level Intermediate',
      registered: '9.876 Registered',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
    Recommendation(
      image: 'assets/js.png',
      title: 'JavaScript Project',
      level: 'Level Advanced',
      registered: '7.543 Registered',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    dynamic myData = widget.category;
    dynamic uid = widget.user_id;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Image.asset('assets/Left.png'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Classes',
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color.fromARGB(255, 31, 30, 30),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 25),
                          alignment: Alignment.center,
                          child: Text(
                            'HTML',
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 31, 30, 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Paid(dataKelas: _items[index], user_id: uid),
                        ),
                      );
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

  Widget buildRecommendationItem(dynamic items) {
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
                    child: Image.asset(
                      '${items['logo']}',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items['title'],
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Level: ${items['level']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: items['rate'],
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
                                  items['rate'] = rating;
                                });
                              },
                            ),
                            Text(
                              items['rate'].toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
