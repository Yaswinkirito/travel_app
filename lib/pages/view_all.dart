import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

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
              padding: const EdgeInsets.only(right: 12),
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
        body: const ViewTile(
          collection: 'places',
        ));
  }
}

class ViewTile extends StatelessWidget {
  const ViewTile({super.key, required this.collection});
  final String collection;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(collection).snapshots(),
        builder: (BuildContext context, snapshot) {
          List l = [];

          if (!snapshot.hasData) {
            return Container(
                child: const Center(child: CircularProgressIndicator()));
          } else {
            final c = snapshot.data!.docs.reversed.toList();

            for (var v in c) {
              l.add([v['name'], v['rate']]);
            }

            return ListView.builder(
                itemCount: l.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: ListTile(
                          tileColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          title: Text(
                            l[index][0],
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: RatingBar.builder(
                              itemSize: 18,
                              initialRating: l[index][1],
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ignoreGestures: true,
                              itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 1.0,
                                  ),
                              onRatingUpdate: (rating) {}),
                          textColor: Colors.white,
                        ),
                        onTap: () {
                          context.go(
                              '/detail/${l[index][0]}/${l[index][2]}/${l[index][1]}');
                        },
                      ));
                });
          }
        });
  }
}
