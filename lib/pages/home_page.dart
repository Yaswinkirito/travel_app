import 'package:flutter/material.dart';
import 'package:travel_app/Components.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: bar(),
        ),
        SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const SlideText(s: "Popular", i: 15.0);
                })),
        SizedBox(
          height: 200,
          width: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 201,
                    width: 261,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Recommended",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "View",
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(8, (index) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 200,
                    width: 261,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ));
              })),
        )
      ]),
    );
  }
}

class bar extends StatelessWidget {
  const bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Icon(
        Icons.menu_outlined,
        size: 43,
      ),
      Text(
        "Discover",
        style: TextStyle(fontSize: 43),
      ),
      Icon(
        Icons.circle,
        size: 43,
      )
    ]);
  }
}
