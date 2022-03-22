import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';
import 'package:instagram_clone/account_page.dart';

class TabPage extends StatefulWidget {
  final User user;
  const TabPage(this.user, {Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  late List _pages;

  @override
  void initState() {
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ));
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
