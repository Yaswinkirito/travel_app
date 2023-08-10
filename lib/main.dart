import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/starting_page.dart';
import 'package:travel_app/routes.dart';

import 'Components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton(
      {super.key,
      required this.page,
      required this.message,
      required this.icon});
  final String page;
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.go(page),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(80, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: Colors.purple.shade800),
        child: SizedBox(
            width: 79,
            child: Row(
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                )
              ],
            )));
  }
}

class Home extends StatelessWidget {
  const Home({super.key, this.size});
  final size;
  final Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: NavBar(c: c),
        body: Pages());
  }
}
