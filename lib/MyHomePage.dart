import 'dart:js';

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:aun_wel/login.dart';
import 'package:aun_wel/signup.dart';
import 'package:aun_wel/sports.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void navigateToPage(int index) {
  switch (index) {
    case 0:
      Navigator.of(context as BuildContext)
          .push(MaterialPageRoute(builder: (context) => sports()));
      break;
    case 1:
      Navigator.of(context as BuildContext)
          .push(MaterialPageRoute(builder: (context) => login()));
      break;
    case 2:
      Navigator.of(context as BuildContext)
          .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
      break;

    default:
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> carouselImages = [
    'image1.jpg', // Replace with your image paths
    'image2.jpg',
    'image3.jpg',
  ];
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // Carousel container with fixed height
      Container(
        height: MediaQuery.of(context).size.height *
            0.5, // Set to half screen height
        child: AnotherCarousel(
          boxFit: BoxFit.cover,
          images: [
            NetworkImage(
              'https://images.pexels.com/photos/16902034/pexels-photo-16902034/free-photo-of-manchester-united.jpeg?auto=compress&cs=tinysrgb&w=600',
            ),
            NetworkImage(
              "https://images.pexels.com/photos/957312/chess-checkmated-chess-pieces-black-white-957312.jpeg?auto=compress&cs=tinysrgb&w=600",
            ),
          ],
        ),
      ),
      Expanded(
        child: GridView.count(
          crossAxisCount: 3, // Two columns in the grid
          mainAxisSpacing: 12.0, // Spacing between rows
          crossAxisSpacing: 12.0, // Spacing between columns
          children: List.generate(6, (index) => _buildSquare(index)),
        ),
      ),
      GNav(
          onTabChange: (i) {
            // if (i == 0) {
            //   Navigator.of(context ).pushNamed('home');
            // } else if (i == 1) {
            //   Navigator.of(context).pushNamed('notifications');
            // }
          },
          selectedIndex: 0,
          activeColor: Color.fromARGB(255, 39, 127, 111),
          tabBackgroundColor: Color.fromARGB(255, 201, 241, 226),
          tabs: [
            GButton(
              gap: 8,
              icon: Icons.home,
              text: "الرئيسية",
            ),
            GButton(
              gap: 8,
              icon: Icons.notification_important,
              text: "الاشعارات",
            ),
            GButton(gap: 8, icon: Icons.list, text: "خاص بك"),
            GButton(gap: 8, icon: Icons.person, text: "حسابك")
          ]),
    ]));
  }
}

Widget _buildSquare(int index) {
  final List<IconData> icons = [
    Icons.sports, // You can add more icons here for other squares
    Icons.book,
    Icons.calendar_today,
    Icons.person,
    Icons.settings,
    Icons.notifications,
  ];

  final List<String> texts = [
    "النشاط الرياضي", // You can add more text labels here for other squares
    "النشاط الاجتماعي",
    "Events",
    "Profile",
    "Settings",
    "Notifications",
  ];

  return GestureDetector(
    onTap: () {
      // Handle click action for square ${index + 1}
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 213, 213),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons[index], size: 16.0),
          Text(texts[index], style: TextStyle(fontSize: 12.0)),
        ],
      ),
    ),
  );
}
