import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class Forum1 extends StatefulWidget {
  const Forum1({super.key});

  @override
  State<Forum1> createState() => _ModulState();
}

class _ModulState extends State<Forum1> {
  final List<ChatMessage> _messages = [];

  void _addMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: Container(
                  child: Image.asset('assets/Left.png'),
                ),
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
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
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
                  color: const Color.fromARGB(255, 117, 116, 116).withOpacity(0.5),
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
                  onPressed: () => _addMessage('text'),
                ),
                IconButton(
                  icon: const Icon(Icons.link_off_outlined),
                  onPressed: () => _addMessage('text'),
                ),
                Expanded(
                  child: TextField(
                    onSubmitted: _addMessage,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _addMessage('Send button pressed'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'User',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
