import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/Components.dart';

import '../main.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExtendBar(
        size: size,
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(child: Text("hello")),
          ),
        ]),
      ),
    );
  }
}

class ExtendBar extends StatefulWidget {
  const ExtendBar({super.key, required this.size});
  final size;

  @override
  State<ExtendBar> createState() => _ExtendBarState();
}

class _ExtendBarState extends State<ExtendBar> {
  double rate = 0;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    double r = 50.0;

    return Container(
        padding: EdgeInsets.only(
            top: widget.size.height * (0.65) * (0.08),
            left: widget.size.width * (0.08),
            right: widget.size.width * (0.08)),
        height: widget.size.height * (0.65),
        width: widget.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(r), topRight: Radius.circular(r)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: const Text("Mount Fuji",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "NotoSerifVithkuqi",
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Honshu, Japan",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 18,
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 1.0,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating;
                    setState(() {
                      print("Hello");
                    });
                  },
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text("$rate")
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: (_count < 10) ? 122 : 130,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: const Button(icon: Icons.remove),
                        onTap: () {
                          setState(() {
                            _count--;
                            if (_count < 0) {
                              _count = 0;
                            }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 20, right: 20),
                        child: Center(
                            child: Text(
                          "$_count",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      GestureDetector(
                        child: const Button(icon: Icons.add),
                        onTap: () {
                          setState(() {
                            _count++;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  child: Icon(
                    Icons.schedule,
                    size: 30,
                  ),
                  padding: EdgeInsets.fromLTRB(12, 0, 4, 0),
                ),
                Padding(
                  child: Text(
                    "$_count Days",
                    style: TextStyle(fontSize: 18),
                  ),
                  padding: EdgeInsets.fromLTRB(4, 0, 8, 0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Descrpition(
                title: "Description",
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dignissim augue sed fringilla posuere. Etiam sagittis, nibh vitae maximus feugiat, neque urna pretium arcu, non fringilla mi sapien et dolor. Phasellus ut interdum nisi. Quisque a lectus tortor. Proin varius ultrices tortor ac rutrum."),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(r"$400/package"),
              GoButton(
                icon: Icons.menu,
                page: "/home",
                state: false,
                message: "Book Now",
              )
            ])
          ],
        ));
  }
}
