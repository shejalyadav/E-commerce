import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ecommerce/screens/checkout.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:flutter/material.dart';

class BottomNvarBar extends StatefulWidget {
  @override
  State<BottomNvarBar> createState() => _HomeState();
}

class _HomeState extends State<BottomNvarBar> {
  int _page = 0;

  List<Widget> _pages = [HomePage(), ProfilePage(), Checkout()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            backgroundColor: Color.fromARGB(0, 227, 171, 249),
            buttonBackgroundColor: Color.fromARGB(255, 176, 163, 163),
            animationDuration: Duration(milliseconds: 300),
            color: Color.fromARGB(255, 176, 163, 163),
            items: [
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.trolley,
                  color: Colors.black,
                ),
              ),
            ]),
      ),
    );
  }
}
