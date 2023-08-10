import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
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
        height: widget.size.height * (0.65),
        width: widget.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(r), topRight: Radius.circular(r)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text("Hello"),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Icon(Icons.pin_drop_rounded),
                  ),
                  Text(
                    "Honshu, Japan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  RatingBar.builder(
                    itemSize: 30,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
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
                  Text("$rate")
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () {
                    setState(() {
                      _count--;
                      if (_count < 0) {
                        _count = 0;
                      }
                    });
                  },
                ),
                Text("$_count"),
                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () {
                    setState(() {
                      _count++;
                    });
                  },
                )
              ],
            )
          ],
        ));
  }
}
