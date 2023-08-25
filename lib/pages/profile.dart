import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';

import '../Components.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.black, size: 30),
          title: const Text(
            "Discover",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 12),
              icon: const Icon(
                size: 40,
                Icons.circle,
                color: Colors.black,
              ),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: NavBar(c: c),
        body: Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {},
            child: const Text('Sign In', style: TextStyle(fontSize: 16)),
          ),
        ));
  }
}
