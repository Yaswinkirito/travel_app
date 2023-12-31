import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:travel_app/Components.dart';
import 'package:travel_app/services.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  var slide = Slides(currentIndex: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Column(children: [
          SizedBox(
              height: 48,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                      child: GestureDetector(
                          child: slide.GetTag(index),
                          onTap: () {
                            slide.tag(index);
                            setState(() {});
                            print(slide.slidenames);
                          }),
                    );
                  })),
          const SizedBox(
              height: 300,
              width: 600,
              child: StreamCarousel(
                  collection: 'places', height: 0.5, width: 0.48, grid: false)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: const Text(
                      "View All",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      context.go('/view');
                    },
                  )
                ]),
          ),
          const Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: StreamCarousel(
                    collection: 'places', height: 200, width: 261, grid: true)),
          )
        ]));
  }
}

class bar extends StatelessWidget {
  const bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu_outlined,
          size: 43,
        ),
        Text(
          "Discover",
          style: TextStyle(fontSize: 25),
        ),
        Icon(
          Icons.person,
          size: 43,
        )
      ]),
    );
  }
}
