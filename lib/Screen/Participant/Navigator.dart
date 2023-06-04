import 'package:flutter/material.dart';
import '../Home/Participant/homeV2.dart';
import '../Participant/CategoryPage.dart';
import '../Participant/ChartPage.dart';
import '../Participant/PageProgres.dart';
import '../Participant/ProfilePage.dart';

class PNavigator extends StatefulWidget {
  final String? name;
  final String? uid;

  const PNavigator({super.key, this.name, this.uid});

  @override
  _NyobaState createState() => _NyobaState();
}

class _NyobaState extends State<PNavigator> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Homepage(name: widget.name, uid: widget.uid),
      const CategoryPage(),
      const ChartPage(),
      Progres(name: widget.name, uid: widget.uid),
      const Profile(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category, color: Colors.black),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.black),
              label: 'Progres',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
