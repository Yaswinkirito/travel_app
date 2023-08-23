import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/pages/home_page.dart';

import 'package:travel_app/routes.dart';

import 'Components.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton(
      {super.key,
      required this.page,
      required this.message,
      required this.icon,
      required this.state});
  final String page;
  final String message;
  final IconData icon;
  final bool state;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.go(page),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(80, 39),
            shape: RoundedRectangleBorder(
                borderRadius: (state)
                    ? BorderRadius.circular(20.0)
                    : BorderRadius.circular(28.0)),
            backgroundColor: Colors.purple.shade800),
        child: SizedBox(
            width: 84,
            child: (state)
                ? Row(
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
                  )
                : Center(
                    child: Text(
                    message,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))));
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
        body: Pages());
  }
}
