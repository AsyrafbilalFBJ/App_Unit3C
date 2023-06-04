import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'SubCategory.dart';

class CategoryPage extends StatefulWidget {
  final dynamic uid;

  const CategoryPage({super.key, this.uid});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _textEditingController = TextEditingController();

  DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('Category');

  late List<dynamic> dataList;
  // late List<dynamic> filteredList;

  @override
  void initState() {
    super.initState();
    dataList = [];
    _database = FirebaseDatabase.instance.reference().child('Category');

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

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic uid = widget.uid;
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 15),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchWidget(
              controller: _textEditingController,
              onChanged: (value) {
                // Lakukan aksi yang diinginkan saat nilai pencarian berubah
                // Misalnya, perbarui daftar tampilan dengan hasil pencarian yang relevan
              },
            ),
          ),
          const SizedBox(height: 55),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Classes(category: dataList[0], user_id: uid),
                          ),
                        );
                        debugPrint(dataList[0]);
                      },
                      child: Container(
                        width: 180,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(
                            255,
                            int.parse('FF', radix: 16),
                            int.parse('95', radix: 16),
                            int.parse('5B', radix: 16),
                          ),
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
                          children: [
                            Image.asset(
                              'assets/icHtml.png',
                              width: 160,
                              height: 190,
                            ),
                            const Text(
                              'HTML',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Classes(category: dataList[3], user_id: uid),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(
                            255,
                            int.parse('E9', radix: 16),
                            int.parse('4C', radix: 16),
                            int.parse('DB', radix: 16),
                          ),
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
                          children: [
                            Image.asset(
                              'assets/c_sharp.png',
                              width: 160,
                              height: 190,
                            ),
                            const Text(
                              'C#',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Classes(category: dataList[2], user_id: uid),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF4FB0FF),
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
                          children: [
                            Image.asset(
                              'assets/java.png',
                              width: 160,
                              height: 190,
                            ),
                            const Text(
                              'Java ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Classes(category: dataList[1], user_id: uid),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(255, 230, 67, 1),
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
                          children: [
                            Image.asset(
                              'assets/js.png',
                              width: 160,
                              height: 190,
                            ),
                            const Text(
                              'Javascript',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 223, 217, 217),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search For Product...",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
