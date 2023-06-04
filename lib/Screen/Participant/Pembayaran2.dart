import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CategoryPage.dart';
import 'ChartPage.dart';
import 'PageOtp.dart';

class Paid extends StatefulWidget {
  const Paid({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Paid> {
  double _rating = 3.0;

  List<Recommendation> recommendations = [
    Recommendation(
      image: '',
      title: '',
      level: 'Level Beginner',
      registered: '13.252 Registered',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: '',
    ),
  ];
  List<Registration> registration = [
    Registration(
      level: 'Level Beginner',
      registered: '13.252 Registered',
      // price: 'Rp. 99.000',
    ),
  ];
  List<Reward> rewards = [
    Reward(
      level: 'Level Beginner',
      image: 'assets/java.png',
      registered: '13.252 Registered',
      // price: 'Rp. 99.000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Java Aplication',
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
                  'assets/java.png',
                  width: 170,
                  height: 170,
                ),
              )
            ],
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
                        builder: (context) =>
                            DetailPage(recommendation: recommendations[index]),
                      ),
                    );
                  },
                  child: Column(
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
                      builRegistration(registration[index]),
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
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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
                      // builReward(rewards[index]),
                    ],
                  )
                  // child: buildFeedback(recommendations[index]),
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget builReward(Reward reward) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: rewards.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Navigasi ke halaman yang diinginkan sesuai dengan indeks item
            if (index == 0) {
              // Navigasi ke halaman Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryPage()),
              );
            } else if (index == 1) {
              // Navigasi ke halaman Akun
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChartPage()),
              );
            } else if (index == 2) {
              // Navigasi ke halaman Ubah Password
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OtpPage()),
              );
            }
            // Tambahkan penanganan navigasi untuk item lainnya sesuai kebutuhan
          },
          child: Column(
            children: [
              // ListTile(
              //   title: Text(judulItems[index]),
              // ),
              // Divider(),
              Container(
                width: 170,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                // child: Row(
                //   children: [
                //     Image.asset(
                //       reward.image,
                //     )
                //   ],
                // ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget builRegistration(Registration registration) {
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
                                fontSize: 23,
                                color: Color.fromARGB(255, 79, 78, 78),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Level Beginner . 13.252 Registered',
                          style: TextStyle(
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Rp. 99.000',
                          style: TextStyle(
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
                                      'Payment Success',
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
                                      'Thanks for your register',
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
                                          color:
                                              const Color.fromARGB(255, 55, 53, 53),
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

  Widget buildFeedback(Recommendation recommendation) {
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                        // padding: EdgeInsets.only(right: 20),
                        // alignment: Alignment.centerRight,
                        // child: Image.asset(
                        //   recommendation.icright,
                        //   height: 100,
                        // )
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

class Registration {
  final String level;
  final String registered;

  Registration({
    required this.level,
    required this.registered,
  });
}

class Reward {
  final String level;
  final String image;
  final String registered;

  Reward({
    required this.level,
    required this.image,
    required this.registered,
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
