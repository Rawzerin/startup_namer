// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return MaterialApp(

      title: 'Welcome to Flutter',

      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'book',
            ),

          ], //<BottomNavigationItem>[]


          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          //  onTap: _onItemtaped ,

        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.account_balance),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        backgroundColor: Colors.blue[100],

        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 40.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,

            ),


          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [

              DrawerHeader(
                  child: Text('DrawerHeader'))
            ],
          ),
        ),
      ),
    );
  }
}