import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

void main() {
  runApp(homepage());
}

class homepage extends StatelessWidget {
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

      // Content below the carousel (optional)
      Expanded(
        child: GridView.count(
          crossAxisCount: 3, // Two columns in the grid
          mainAxisSpacing: 12.0, // Spacing between rows
          crossAxisSpacing: 12.0, // Spacing between columns
          children: List.generate(6, (index) => _buildSquare(index)),
        ),
      ),

      // Navigation bar
      BottomNavigationBar(
        backgroundColor: Color.fromARGB(219, 239, 3, 3),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // Handle navigation logic here
        onTap: (index) {
          // Implement your navigation logic based on the selected index
          // For example, navigate to different screens/pages.
        },
      ),
    ]));
  }

  Widget _buildSquare(int index) {
    return GestureDetector(
      onTap: () {
        // Handle click action for square ${index + 1}
      },
      child: Container(
        padding: const EdgeInsets.all(.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 222, 213, 213),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 16.0), // Replace with your desired icon
            Text("Square ${index + 1}",
                style: TextStyle(
                    fontSize: 12.0)), // Replace with your desired text
          ],
        ),
      ),
    );
  }
}
