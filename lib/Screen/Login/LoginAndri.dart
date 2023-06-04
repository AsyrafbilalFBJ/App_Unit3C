import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit3c_3/Screen/Register/RegisterAndri.dart';
import 'package:unit3c_3/Screen/Participant/Navigator.dart';
import 'package:unit3c_3/Screen/Mentor/MNavigator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  String getNama() {
    //untuk mengambil nama
    return _LoginPageState().getNama();
  }

  String getEmail() {
    //untuk mengambil email
    return _LoginPageState().getEmail();
  }
}

class _LoginPageState extends State<LoginPage> {
  int selectedRole = 0;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  var nama = "";
  var email = "";

  void _login(context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      //debugPrint('User: ${userCredential.user}');
      String role = selectedRole.toString();
      // role = 1 (participant) role = 2 (mentor)

      if (userCredential.user != null && role == '1') {
        final snapshotAcc =
            await _db.child('Account/user-${userCredential.user!.uid}').get();
        final snapshot =
            await _db.child('User/user-${userCredential.user!.uid}').get();
        if (snapshot.value != null &&
            snapshot.child('role').value.toString() == 'Participant') {
          debugPrint('Login berhasil sebagai ${_emailController.text}\n${snapshot.value}');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PNavigator(
                    name: snapshotAcc.child('name').value.toString(),
                    uid: snapshotAcc
                        .child('uid')
                        .value
                        .toString())), //route ke home participant
          );
        } else if (snapshot.value != null &&
            snapshot.child('role').value.toString() != 'Participant') {
          //debugPrint('Login gagal user tersebut bukan participant');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login gagal user tersebut bukan participant'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          debugPrint('Login gagal');
        }
      } else if (userCredential.user != null && role == '2') {
        final snapshot =
            await _db.child('User/user-${userCredential.user!.uid}').get();
        final snapshot2 =
            await _db.child('Account/user-${userCredential.user!.uid}').get();
        if (snapshot.value != null &&
            snapshot.child('role').value.toString() == 'Mentor') {
          debugPrint('Login berhasil sebagai ${_emailController.text}');
          setNama(snapshot2.child('name').value.toString());
          setEmail(snapshot2.child('email').value.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MNavigator(
                    name: snapshot2.child('name').value.toString(),
                    uid: snapshot2
                        .child('uid')
                        .value
                        .toString())), //route ke home mentor
          );
        } else {
          //debugPrint('Login gagal user tersebut bukan mentor');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login gagal user tersebut bukan mentor'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login gagal pilih role terlebih dahulu'),
            duration: Duration(seconds: 3),
          ),
        );
        debugPrint('Login gagal');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email tidak ditemukan / belum terdaftar'),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password salah'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login gagal'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  String getNama() {
    return nama;
  }

  String getEmail() {
    return email;
  }

  void setNama(String nama) {
    this.nama = nama;
  }

  void setEmail(String email) {
    this.email = email;
  }

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
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Login Participant',
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
                      controller: _emailController,
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
                      // Logika login
                      _login(context);
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
