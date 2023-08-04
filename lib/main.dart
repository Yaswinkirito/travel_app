import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) =>
            MyHomePage(size: MediaQuery.of(context).size)),
    GoRoute(
        path: '/home',
        builder: (context, state) => Home(size: MediaQuery.of(context).size))
  ],
);

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
              Align(
                  alignment: Alignment.bottomLeft,
                  child: GoButton(
                    page: '/home',
                    message: "Let's Go!",
                  ))
            ]))
      ])),
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({super.key, required this.page, required this.message});
  final String page;
  final String message;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.go(page),
        style: ElevatedButton.styleFrom(
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
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            )));
  }
}

class Home extends StatelessWidget {
  const Home({super.key, this.size});
  final size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ElevatedButton(
              onPressed: () => context.go('/'), child: Text('Return')),
        ));
  }
}
