import 'package:flutter/material.dart';

import '../main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.size});
  final size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 8.0, right: 8.0, bottom: 20.0),
          child: AspectRatio(
            aspectRatio: 350 / 323,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(31)),
                  color: Colors.black),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(children: [
              ListTile(
                title: Text(
                  "Winter\nVacation Trips",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500, height: 1.25),
                ),
                subtitle: Text(
                  "\nEnjoy your winter vacation with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!",
                  style: TextStyle(fontSize: 18),
                ),
                dense: false,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GoButton(
                        page: '/home',
                        message: "Let's Go!",
                        icon: Icons.arrow_forward,
                      )))
            ]))
      ])),
    );
  }
}
