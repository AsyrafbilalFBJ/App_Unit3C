import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit3c_3/Screen/Login/LoginAndri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectedRole = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    String role = selectedRole.toString();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Add user to database
      final db = FirebaseDatabase.instance.ref();
      db.child("Account").child('user-${userCredential.user!.uid}').set({
        "name": _nameController.text,
        "email": _emailController.text,
        "uid": userCredential.user!.uid,
      });
      // set role dan masukan ke database user = participant/mentor = 1/2
      if (selectedRole == 1) {
        db.child("User").child('user-${userCredential.user!.uid}').set({
          "role": "Participant",
        });
      } else if (selectedRole == 2) {
        db.child("User").child('user-${userCredential.user!.uid}').set({
          "role": "Mentor",
        });
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 25),
                child: Image.asset('assets/Unit 3c2.png')),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
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
                      controller: _passwordController,
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
                  height: 10,
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
                      'Create Account',
                      style: GoogleFonts.quicksand().copyWith(
                        color:
                            Colors.white, // Mengubah warna teks menjadi putih
                        fontSize: 16, // Mengubah ukuran font teks
                        fontWeight:
                            FontWeight.bold, // Mengatur gaya huruf italic
                      ),
                    ),
                    onPressed: () {
                      // Logika login
                      _register();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
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
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Existing User ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 91, 89, 89),
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
                                Text(
                                  'Login',
                                  style: GoogleFonts.quicksand().copyWith(
                                    color: Colors
                                        .white, // Mengubah warna teks menjadi putih
                                    fontSize: 16, // Mengubah ukuran font teks
                                    fontWeight: FontWeight
                                        .bold, // Mengatur gaya huruf italic
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              // Route ke halam login
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
