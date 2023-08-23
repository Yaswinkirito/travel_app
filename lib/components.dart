import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Text("Hello")),
      Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      )),
      Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      )),
      Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      )),
    ]);
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.c,
  });

  final Color c;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(
            bottom: 40, left: size.width * (0.08), right: size.width * (0.08)),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            height: size.height * (0.1),
            width: size.width * (0.1),
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Symbol(
                      name: Icons.house,
                      index: 0,
                      selectedIndex: selectedIndex,
                    ),
                    onTap: () => {
                      context.go("/home"),
                      setState(() {
                        selectedIndex = 0;
                      })
                    },
                  ),
                  GestureDetector(
                    child: Symbol(
                      name: Icons.calendar_month_outlined,
                      index: 1,
                      selectedIndex: selectedIndex,
                    ),
                    onTap: () => {
                      setState(() {
                        selectedIndex = 1;
                        print(selectedIndex);
                      })
                    },
                  ),
                  GestureDetector(
                    child: Symbol(
                      name: Icons.search,
                      index: 2,
                      selectedIndex: selectedIndex,
                    ),
                    onTap: () => {
                      context.go("/home"),
                      setState(() {
                        selectedIndex = 2;
                      })
                    },
                  ),
                  GestureDetector(
                    child: Symbol(
                      name: Icons.person,
                      index: 3,
                      selectedIndex: selectedIndex,
                    ),
                    onTap: () => {
                      context.go("/home"),
                      setState(() {
                        selectedIndex = 3;
                      })
                    },
                  ),
                ]),
          ),
        ));
  }
}

// ignore: must_be_immutable
class Symbol extends StatelessWidget {
  Symbol(
      {super.key,
      required this.name,
      required this.index,
      required this.selectedIndex});
  final name;
  var click1 = false;
  final index;
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Icon(name,
        size: 40, color: (selectedIndex == index) ? Colors.black : Colors.grey);
  }
}

class Slides {
  Slides({required this.currentIndex});
  final int currentIndex;
  List slidenames = [
    ["Popular", false],
    ["Featured", false],
    ["Most Visted", false],
    ["Europe", false],
    ["Asia", false],
    ["Africa", false]
  ];
  void tag(int i) {
    for (int j = 0; j < slidenames.length; j++) {
      slidenames[j][1] = false;
    }
    slidenames[i][1] = true;
  }

  Padding GetTag(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        slidenames[index][0],
        style: TextStyle(
            fontWeight:
                slidenames[index][1] ? FontWeight.bold : FontWeight.w400,
            fontSize: 20),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.0,
      height: 45,
      child: Center(
        child: Icon(
          icon,
          size: 28,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(138, 43, 226, 10),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Descrpition extends StatelessWidget {
  const Descrpition({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 16),
      )
    ]);
  }
}

class CarouselDetails extends StatelessWidget {
  const CarouselDetails({super.key, required this.name, required this.rate});
  final String name;
  final rate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        visualDensity: VisualDensity(vertical: 3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        tileColor: Colors.black.withOpacity(0.35),
        title: Text(
          name,
          style: TextStyle(fontSize: 22),
        ),
        trailing: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 16,
          child: Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 20,
          ),
        ),
        subtitle: RatingBar.builder(
            itemSize: 18,
            initialRating: rate,
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
    );
  }
}
