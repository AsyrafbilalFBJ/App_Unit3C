
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit3c_3/Screen/Register/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int selectedRole = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 50),
                child: Image.asset('assets/Unit 3c2.png')),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 223, 217, 217),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email/Phone',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 223, 217, 217),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.quicksand(
                            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedRole == 1
                            ? const Color.fromARGB(255, 103, 100, 100)
                            : const Color.fromARGB(255, 223, 217, 217),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedRole = 1;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Participant',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedRole == 2
                            ? const Color.fromARGB(255, 103, 100, 100)
                            : const Color.fromARGB(255, 223, 217, 217),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedRole = 2;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Mentor',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 240,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 66, 62, 62),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Menghapus warna latar belakang ElevatedButton
                      elevation: 0, // Menghapus bayangan ElevatedButton
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.quicksand().copyWith(
                        color:
                            Colors.white, // Mengubah warna teks menjadi putih
                        fontSize: 16, // Mengubah ukuran font teks
                        fontWeight:
                            FontWeight.bold, // Mengatur gaya huruf italic
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Nyoba(),
                      //   ),
                      // );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color.fromARGB(255, 114, 113, 113),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Color.fromARGB(255, 114, 113, 113),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 201, 199, 199),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Menghapus warna latar belakang ElevatedButton
                      elevation: 0, // Menghapus bayangan ElevatedButton
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon_google.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Continue With Google',
                          style: GoogleFonts.quicksand().copyWith(
                            color: const Color.fromARGB(255, 46, 45,
                                45), // Mengubah warna teks menjadi putih
                            fontSize: 16, // Mengubah ukuran font teks
                            fontWeight:
                                FontWeight.bold, // Mengatur gaya huruf italic
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Logika login
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'New User ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Container(
                  width: 240,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 66, 62, 62),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Menghapus warna latar belakang ElevatedButton
                      elevation: 0, // Menghapus bayangan ElevatedButton
                    ),
                    child: Text(
                      'Register',
                      style: GoogleFonts.quicksand().copyWith(
                        color:
                            Colors.white, // Mengubah warna teks menjadi putih
                        fontSize: 16, // Mengubah ukuran font teks
                        fontWeight:
                            FontWeight.bold, // Mengatur gaya huruf italic
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
