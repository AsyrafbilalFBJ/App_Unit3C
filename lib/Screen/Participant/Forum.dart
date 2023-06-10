import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class Forum1 extends StatefulWidget {
  const Forum1({super.key});

  @override
  State<Forum1> createState() => _ModulState();
}

class _ModulState extends State<Forum1> {
  final String idforum = '-NXALXtdkEvPYux5sWUB';

  late List<Map<dynamic, dynamic>> dataMessage;

  DatabaseReference _database = FirebaseDatabase.instance.ref();

  final TextEditingController _controllermsg = TextEditingController();

  void _addMessage(String text) {
    _database.push().set(<String, dynamic>{
      'id': _database.push().key.toString(),
      'id_kelas': '-NX5qHN3Gya-cSh3fFt0',
      'senderName': 'Saeful Anwar',
      'senderId': 'Participant',
      'text': text,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  void initState() {
    super.initState();
    dataMessage = [];
    _database = FirebaseDatabase.instance.ref().child('Forums').child(idforum);

    _database.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          Map<dynamic, dynamic> dataMsg =
          event.snapshot.value as Map<dynamic, dynamic>;
          dataMessage = [];
          dataMsg.forEach((key, value) {
            dataMessage.add(value);
          });
        });
      }
    });
  }

  Widget _buildChatItem(Map<dynamic, dynamic> message) {
    final String senderId = message['senderId'] as String;
    final String senderName = message['senderName'] as String;
    final String text = message['text'] as String;

    final bool isMentor = senderId == 'Mentor';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: isMentor ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isMentor ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            senderName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isMentor ? Colors.grey[300] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMentor ? Colors.black : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  child: Image.asset('assets/Left.png'),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Forum',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 31, 30, 30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Java Fundamental',
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 31, 30, 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataMessage.length,
              itemBuilder: (context, index) {
                final message = dataMessage[index];
                return _buildChatItem(message);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 203, 202, 200),
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
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Under Construction'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.link_off_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Under Construction'),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controllermsg,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controllermsg.text.isNotEmpty) {
                      _addMessage(_controllermsg.text);
                      // Clear textfield
                      _controllermsg.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please type a message'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
