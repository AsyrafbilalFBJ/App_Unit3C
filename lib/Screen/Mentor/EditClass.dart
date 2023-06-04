import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditClass extends StatefulWidget {
  final dynamic id_kelas;

  const EditClass({super.key, this.id_kelas});

  @override
  State<EditClass> createState() => _ModulState();
}

class _ModulState extends State<EditClass> {
  DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('classes');

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var categoryController = TextEditingController();
  var logoController = TextEditingController();
  var levelController = TextEditingController();
  var colorController = TextEditingController();
  var priceController = TextEditingController();

  late List<dynamic> _items;

  @override
  void initState() {
    super.initState();
    _items = [];
    _database = FirebaseDatabase.instance.ref().child('classes');

    _database
        .orderByChild('id_kelas')
        .equalTo(widget.id_kelas)
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

  Future<void> _updateItem(
      String id,
      String title,
      String description,
      String category,
      String logo,
      String level,
      String registered,
      String rate,
      String color,
      String price) async {
    // _database.push().set({'title': title, 'description': description}
    await _database.child(id).set({
      'id_kelas': id,
      'title': title,
      'description': description,
      'category': category,
      'logo': '../assets/' + logo + '.png',
      'level': level,
      'registered': int.parse(registered),
      'rate': int.parse(rate),
      'color': color,
      'price': int.parse(price)
    });
  }

  String selectedValue = 'Option 1';
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';
    String category = '';
    String logo = '';
    String level = '';
    String registered = '${_items[0]['registered'].toString()}';
    String rate = '${_items[0]['rate'].toString()}';
    String color = '';
    String price = '';
    // dynamic levelList = widget._databaseCat;

    titleController.text = _items[0]['title'].toString();
    descriptionController.text = _items[0]['description'].toString();
    categoryController.text = _items[0]['category'].toString();
    logoController.text = _items[0]['logo'].toString();
    levelController.text = _items[0]['level'].toString();
    colorController.text = _items[0]['color'].toString();
    priceController.text = _items[0]['price'].toString();

    dynamic idKelas = widget.id_kelas;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: <Widget>[
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Edit Class',
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
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Title',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'HTML Expert',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Category',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: categoryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'HTML',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
                  height: 180,
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
                    child: TextField(
                      controller: descriptionController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your description',
                        hintStyle: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Level',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: levelController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Beginner',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Price',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'RP.',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: priceController,
                            textAlign: TextAlign.right,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly,
                            //   CurrencyInputFormatter(),
                            // ],
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '12000',
                              hintStyle: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 31, 30, 30),
                                ),
                              ),
                            ),
                          ),
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
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Color',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: colorController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'blue',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 7,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Logo',
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
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                  right: 25,
                ),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: logoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'c++',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat container "Start" di klik
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 25,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 45, 44, 44),
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
                          child: TextButton(
                            onPressed: () {
                              _updateItem(
                                  idKelas,
                                  titleController.text,
                                  descriptionController.text,
                                  categoryController.text,
                                  logoController.text,
                                  levelController.text,
                                  registered,
                                  rate,
                                  colorController.text,
                                  priceController.text);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext) {
                                    return CustomDialog2(context);
                                  });
                            },
                            // () {
                            //   setState(() {
                            //     showDialog(
                            //       context: context,
                            //       builder: (BuildContext context) {
                            //         _addItem(title, description, category, logo,
                            //             level, rate, color, price);
                            //         return CustomDialog2(context);
                            //       },
                            //     );
                            //   });
                            // },
                            child: Text(
                              'Edit Class',
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 198, 197, 197),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget CustomDialog2(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Edit Class Success',
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
      // tambahkan konten atau widget lain yang diinginkan di dalam AlertDialog
      // misalnya TextField untuk mengedit kelas
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
          onPressed: () {
            // logika untuk menyimpan perubahan
            Navigator.of(context).pop(); // menutup dialog setelah menyimpan
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
                  'Done',
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
}
