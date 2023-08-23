import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Components.dart';

import '../main.dart';

class Detail extends StatelessWidget {
  const Detail(
      {super.key,
      required this.title,
      required this.description,
      required this.rate,
      required this.image});
  final String title;
  final String description;
  final double rate;
  final String image;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            context.go('/home');
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExtendBar(
        size: size,
        title: title,
        description: description,
        rate: rate,
      ),
      body: FutureBuilder(
          future:
              FirebaseStorage.instance.ref("images/$image").getDownloadURL(),
          builder: (context, t) {
            if (t.hasData) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.network(t.data.toString()).image,
                      fit: BoxFit.cover),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class ExtendBar extends StatefulWidget {
  const ExtendBar(
      {super.key,
      required this.size,
      required this.title,
      required this.description,
      required this.rate});
  final size;
  final String title;
  final String description;
  final double rate;
  @override
  State<ExtendBar> createState() => _ExtendBarState();
}

class _ExtendBarState extends State<ExtendBar> {
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
              child: Text(widget.title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "NotoSerifVithkuqi",
                      fontWeight: FontWeight.w400)),
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
                  widget.title,
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
                  initialRating: widget.rate,
                  minRating: 0,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 1.0,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text("${widget.rate}")
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
                            top: 8.0, bottom: 2.0, left: 20, right: 20),
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
            Descrpition(title: "Description", text: widget.description),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                  text: TextSpan(
                      text: r"$400",
                      style: TextStyle(
                          color: Color.fromRGBO(138, 43, 226, 10),
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                      children: const <TextSpan>[
                    TextSpan(text: "/Package", style: TextStyle(fontSize: 18))
                  ])),
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
