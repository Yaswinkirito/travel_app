import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

import 'components.dart';

class StreamCarousel extends StatelessWidget {
  const StreamCarousel(
      {super.key,
      required this.collection,
      required this.height,
      required this.width,
      required this.grid});
  final String collection;
  final double height;
  final double width;
  final bool grid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(collection).snapshots(),
        builder: (BuildContext context, snapshot) {
          List l = [];

          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            final c = snapshot.data!.docs.reversed.toList();

            for (var v in c) {
              l.add([v['name'], v['rate'], v['details'], v['image']]);
            }

            if (grid) {
              return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      l.length,
                      (index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            child: SizedBox(
                                height: height,
                                width:
                                    MediaQuery.of(context).size.width * width,
                                child: ImageWidget(
                                  name: l[index][0].toString().split(':')[0],
                                  rate: l[index][1],
                                  image: l[index][3],
                                )),
                            onTap: () {
                              context.go(
                                  '/detail/${l[index][0]}/${l[index][2]}/${l[index][1]}/${l[index][3].split('/')[1]}');
                            },
                          ))));
            }
            return ListView.builder(
                itemCount: l.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: SizedBox(
                            height: height,
                            width: MediaQuery.of(context).size.width * width,
                            child: ImageWidget(
                              name: l[index][0],
                              rate: l[index][1],
                              image: l[index][3],
                            )),
                        onTap: () {
                          context.go(
                              '/detail/${l[index][0]}/${l[index][2]}/${l[index][1]}/${l[index][3].split('/')[1]}');
                        },
                      ));
                });
          }
        });
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {super.key, required this.name, required this.rate, required this.image});
  final String name;
  final double rate;
  final String image;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseStorage.instance.ref(image).getDownloadURL(),
      builder: (context, t) {
        if (t.hasData) {
          return Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      image: DecorationImage(
                          image: Image.network(t.data.toString()).image,
                          fit: BoxFit.fill)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [CarouselDetails(name: name, rate: rate)])));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
