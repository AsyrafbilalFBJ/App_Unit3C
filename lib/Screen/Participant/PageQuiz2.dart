// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Quiz2 extends StatefulWidget {
//   const Quiz2({super.key});

//   @override
//   State<Quiz2> createState() => _ModulState();
// }

// class _ModulState extends State<Quiz2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           Column(
//             children: <Widget>[
//               Row(children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15, top: 20),
//                   child: Container(
//                     child: Image.asset('assets/Left.png'),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 35),
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         top: 50,
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Java Aplication',
//                         style: GoogleFonts.quicksand(
//                           textStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                             color: const Color.fromARGB(255, 31, 30, 30),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, bottom: 7, top: 15),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     'Quiz',
//                     style: GoogleFonts.quicksand(
//                       textStyle: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: const Color.fromARGB(255, 31, 30, 30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 25, top: 10, right: 25, bottom: 10),
//                 child: Container(
//                   width: double.infinity,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color:
//                             Color.fromARGB(255, 117, 116, 116).withOpacity(0.5),
//                         spreadRadius: 4,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                       style: GoogleFonts.quicksand(
//                         textStyle: TextStyle(
//                           fontSize: 13,
//                           color: const Color.fromARGB(255, 31, 30, 30),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       // Fungsi yang akan dijalankan saat container "Start" di klik
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         right: 25,
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 95,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: const Color.fromARGB(255, 45, 44, 44),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(255, 117, 116, 116)
//                                   .withOpacity(0.5),
//                               spreadRadius: 4,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Start',
//                             style: GoogleFonts.quicksand(
//                               textStyle: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 198, 197, 197),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
