import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Components.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    var slide = Slides(currentIndex: 0);

    return SafeArea(
      bottom: false,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: bar(),
        ),
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
        SizedBox(
          height: 300,
          width: 600,
          child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 402 * (1 / 3),
                    width: 522 * (0.75),
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
              "View All",
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(8, (index) {
                return GestureDetector(
                  child: Center(
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
                  )),
                  onTap: () => {context.go('/detail')},
                );
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          Icons.circle,
          size: 43,
        )
      ]),
    );
  }
}
