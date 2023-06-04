import 'package:flutter/material.dart';
import '../Mentor/Mforum.dart';
import '../Participant/ChartPage.dart';
import '../Participant/PageOtp.dart';

class Progres extends StatefulWidget {
  final dynamic name;
  final dynamic uid;

  const Progres({super.key, required this.name, required this.uid});
  // const Progres({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Progres> {
  List<Recommendation> recommendations = [
    Recommendation(
      image: 'assets/java.png',
      title: 'Java Application',
      level: '1 Forum posted!',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
    Recommendation(
      image: 'assets/c.png',
      title: 'C Fundamental',
      level: '1 member join',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
    Recommendation(
      image: 'assets/js.png',
      title: 'JavaScript Project',
      level: '1 Question',
      price: 'Rp. 99.000',
      trash: 'assets/Trash.png',
      icright: 'assets/icon _right.png',
    ),
  ];

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
                  'Notifications',
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
                itemCount: recommendations.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigasi ke halaman yang diinginkan sesuai dengan indeks item
                      if (index == 0) {
                        // Navigasi ke halaman Profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MForum()),
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
          children: [
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      recommendation.image,
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
                          recommendation.title,
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          recommendation.level,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 18, 18, 18)),
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
                          recommendation.icright,
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

  final String price;
  final String trash;
  final String icright;

  Recommendation({
    required this.image,
    required this.title,
    required this.level,
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
          ],
        ),
      ),
    );
  }
}
