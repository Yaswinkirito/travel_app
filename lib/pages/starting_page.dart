import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.size});
  final size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: FirebaseStorage.instance
                .ref("images/background.jpg")
                .getDownloadURL(),
            builder: (context, t) {
              if (t.hasData) {
                return SafeArea(
                    child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(t.data.toString()).image,
                          fit: BoxFit.cover)),
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.5 *
                                  0.98,
                            ),
                            const ListTile(
                              title: Text(
                                "Winter\nVacation Trips",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    height: 1.25),
                              ),
                              subtitle: Text(
                                "\nEnjoy your winter vacation with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              dense: false,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: GoButton1(
                                  page: '/home',
                                  message: "Let's Go!",
                                  icon: Icons.arrow_forward,
                                  state: true,
                                ))
                          ])),
                ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
