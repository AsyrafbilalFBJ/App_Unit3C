import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseReference _database = FirebaseDatabase.instance.ref().child('classes');

  late List<dynamic> dataList;

  double _rating = 3.0;

  String searchKeyword = '';

  List<dynamic> searchResult = [];

  void performSearch() {
    setState(() {
      searchResult = dataList
          .where((data) => data['title'].toLowerCase().contains(searchKeyword.toLowerCase()))
          .toList();
    });
  }

  List<Recommendation> recommendations = [
    Recommendation(
      image: 'assets/java.png',
      title: 'Java Application',
      level: 'Level Beginner',
      registered: '13.252 Registered',
    ),
    Recommendation(
      image: 'assets/c.png',
      title: 'C Fundamental',
      level: 'Level Intermediate',
      registered: '9.876 Registered',
    ),
    Recommendation(
      image: 'assets/go.png',
      title: 'Golang Project',
      level: 'Level Advanced',
      registered: '7.543 Registered',
    ),
  ];

  @override
  void initState() {
    super.initState();
    dataList = [];
    _database = FirebaseDatabase.instance.ref().child('classes');

    _database.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          Map<dynamic, dynamic>? dataMap =
          event.snapshot.value as Map<dynamic, dynamic>?;
          dataList = dataMap?.values.toList() ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Hello,',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search For Product...",
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchKeyword = value;
                        });
                      },
                      onSubmitted: (value) {
                        performSearch();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Rekomend For You',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            recommendation: recommendations[index],
                          ),
                        ),
                      );
                    },
                    child: buildRecommendationItem(recommendations[index]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildRecommendationItem(Recommendation recommendation) {
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(recommendation.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommendation.title,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${recommendation.level}. ${recommendation.registered}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: _rating,
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
                            _rating = rating;
                          });
                        },
                      ),
                      Text(
                        '$_rating',
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
    );
  }
}

class Recommendation {
  final String image;
  final String title;
  final String level;
  final String registered;

  Recommendation({
    required this.image,
    required this.title,
    required this.level,
    required this.registered,
  });
}

class DetailPage extends StatelessWidget {
  final Recommendation recommendation;

  const DetailPage({Key? key, required this.recommendation}) : super(key: key);

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
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
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
