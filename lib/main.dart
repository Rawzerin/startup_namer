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

            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'people',
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

/////////////////////////////////////////////class2///////////////////////////////////////////////////
class ScrollingParallax extends StatelessWidget {
  const ScrollingParallax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // a list hold the Parallax items
    return SingleChildScrollView(
      child: Column(
        children: const [],
      ),
    );
  }
}

//////////////////////////////////////////class3///////////////
class LocationListItem extends StatelessWidget {
  const LocationListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.country,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////class4/////////////////////
//to add parallax effect to the background image//
class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);
    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
    (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
  }

  // Calculate the vertical alignment of the background
  // based on the scroll percent.
  final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
}

@override
bool shouldRepaint(covariant FlowDelegate oldDelegate) {
  // TODO: implement shouldRepaint
  throw UnimplementedError();
}
