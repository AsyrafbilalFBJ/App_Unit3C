import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:unit3c_3/Screen/Mentor/MyClass.dart';

class MHomepage extends StatefulWidget {
  final dynamic name;
  final dynamic uid;

  const MHomepage({super.key, this.name, this.uid});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<MHomepage> {
  DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('classes');

  late List<dynamic> dataList;
  // late List<dynamic> filteredList;

  @override
  void initState() {
    super.initState();
    dataList = [];
    _database = FirebaseDatabase.instance.reference().child('classes');

    _database.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          // Retrieve the text data and convert it to a list of strings
          Map<dynamic, dynamic>? dataMap =
              event.snapshot.value as Map<dynamic, dynamic>?;

          dataList = dataMap?.values.toList() ?? [];
        });
      }
    });
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'blueGrey':
        return Colors.blueGrey;
      // Add more cases for other color names as needed
      default:
        return Colors.black;
    }
  }

  // double _rating = 1.0;

  // List<Recommendation> recommendations = [
  //   Recommendation(
  //     image: 'assets/java.png',
  //     title: 'Java Application',
  //     level: 'Level Beginner',
  //     registered: '13.252 Registered',
  //   ),
  //   Recommendation(
  //     image: 'assets/c.png',
  //     title: 'C Fundamental',
  //     level: 'Level Intermediate',
  //     registered: '9.876 Registered',
  //   ),
  //   Recommendation(
  //     image: 'assets/go.png',
  //     title: 'Golang Project',
  //     level: 'Level Advanced',
  //     registered: '7.543 Registered',
  //   ),
  //   Recommendation(
  //     image: 'assets/c.png',
  //     title: 'C Fundamental',
  //     level: 'Level Intermediate',
  //     registered: '9.876 Registered',
  //   ),
  //   Recommendation(
  //     image: 'assets/go.png',
  //     title: 'Golang Project',
  //     level: 'Level Advanced',
  //     registered: '7.543 Registered',
  //   ),
  // ];

  // List<CarouselItem> carouselItems = [
  //   CarouselItem(
  //     image: 'assets/icHtml.png',
  //     title: 'HTML ',
  //     description:
  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.asgfergesrfg',
  //     level: 'Level Beginner',
  //     registered: '13.252 Registered',
  //     price: 'Rp. 99.000',
  //     containerColor: const Color.fromARGB(255, 222, 174, 100),
  //   ),
  //   // Add more CarouselItem objects here
  // ];

  @override
  Widget build(BuildContext context) {
    dynamic myData = widget.name;
    dynamic mydataUid = widget.uid;
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
                child: Text(
                  myData,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
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
              const SizedBox(height: 20),
              // Container(
              //   child: CarouselSlider.builder(
              //     itemCount: carouselItems.length,
              //     itemBuilder: (context, index, _) {
              //       return Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Homepage(),
              //               ),
              //             );
              //           },
              //           child: Container(
              //             width: 700,
              //             height: 300,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: carouselItems[index].containerColor,
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Color.fromARGB(255, 117, 116, 116)
              //                       .withOpacity(0.5),
              //                   spreadRadius: 4,
              //                   blurRadius: 5,
              //                   offset: Offset(0, 3),
              //                 ),
              //               ],
              //             ),
              //             child: Row(
              //               children: [
              //                 Image.asset(
              //                   carouselItems[index].image,
              //                   width: 172,
              //                   height: 202,
              //                 ),
              //                 Expanded(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 25, left: 3, right: 15),
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           carouselItems[index].title,
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 21,
              //                               color: Colors.white,
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(height: 5),
              //                         Flexible(
              //                           child: Text(
              //                             carouselItems[index].description,
              //                             style: GoogleFonts.quicksand(
              //                               textStyle: TextStyle(
              //                                 fontSize: 10,
              //                                 color: Colors.white,
              //                               ),
              //                             ),
              //                             maxLines: 5,
              //                             overflow: TextOverflow.ellipsis,
              //                           ),
              //                         ),
              //                         SizedBox(height: 10),
              //                         Text(
              //                           '${carouselItems[index].level} . ${carouselItems[index].registered}',
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: TextStyle(
              //                               fontSize: 10,
              //                               color: Colors.white,
              //                             ),
              //                           ),
              //                         ),
              //                         SizedBox(height: 10),
              //                         Row(
              //                           children: [
              //                             RatingBar.builder(
              //                               initialRating: _rating,
              //                               minRating: 1,
              //                               direction: Axis.horizontal,
              //                               allowHalfRating: true,
              //                               itemCount: 1,
              //                               itemSize: 30,
              //                               itemPadding: EdgeInsets.symmetric(
              //                                   horizontal: 4.0),
              //                               itemBuilder: (context, _) => Icon(
              //                                 Icons.star,
              //                                 color: Color.fromARGB(
              //                                     255, 247, 203, 70),
              //                               ),
              //                               onRatingUpdate: (rating) {
              //                                 setState(() {
              //                                   _rating = rating;
              //                                 });
              //                               },
              //                             ),
              //                             Text(
              //                               '$_rating',
              //                               style: TextStyle(
              //                                 fontSize: 14,
              //                                 color: const Color.fromARGB(
              //                                     255, 248, 247, 247),
              //                                 fontWeight: FontWeight.w100,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         Align(
              //                           alignment: Alignment.bottomRight,
              //                           child: Container(
              //                             padding: EdgeInsets.only(
              //                                 bottom: 10, right: 10),
              //                             child: Text(
              //                               carouselItems[index].price,
              //                               style: GoogleFonts.quicksand(
              //                                 textStyle: TextStyle(
              //                                   fontSize: 10,
              //                                   color: Colors.white,
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //     options: CarouselOptions(
              //       height: 200,
              //       enableInfiniteScroll: true,
              //       autoPlay: true,
              //       autoPlayInterval: Duration(seconds: 3),
              //       autoPlayAnimationDuration: Duration(milliseconds: 800),
              //       autoPlayCurve: Curves.fastOutSlowIn,
              //       enlargeCenterPage: true,
              //     ),
              //   ),
              // ),
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
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyClass(
                              dataKelas: dataList[index], user_id: mydataUid),
                        ),
                      );
                    },
                    child: buildRecommendationItem(dataList[index]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRecommendationItem(dynamic dataKelas) {
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
              child: Image.asset('${dataKelas['logo']}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataKelas['title'],
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Level: ${dataKelas['level']}' +
                        " . " +
                        '${dataKelas['registered'].toString()} registered',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: dataKelas['rate'],
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
                            dataKelas['rate'] = rating;
                          });
                        },
                      ),
                      Text(
                        dataKelas['rate'].toString(),
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

class CarouselItem {
  final String image;
  final String title;
  final String description;
  final String level;
  final String registered;
  final String price;
  final Color containerColor;

  CarouselItem({
    required this.image,
    required this.title,
    required this.description,
    required this.level,
    required this.registered,
    required this.price,
    required this.containerColor,
  });
}
