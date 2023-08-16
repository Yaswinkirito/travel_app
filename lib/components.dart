import 'package:flutter/material.dart';
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
                    child: Symbol(name: Icons.house),
                    onTap: () => {context.go("/home"), print('hello')},
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.search,
                    size: 40,
                  ),
                  Icon(
                    Icons.person,
                    size: 40,
                  )
                ]),
          ),
        ));
  }
}

// ignore: must_be_immutable
class Symbol extends StatefulWidget {
  Symbol({super.key, required this.name});
  final name;
  var click1 = false;
  @override
  State<Symbol> createState() => _SymbolState();
}

class _SymbolState extends State<Symbol> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Icon(
          widget.name,
          size: 40,
          color: widget.click1 ? Colors.blue.shade600 : Colors.black,
        ),
        onTap: () => setState(
              () {
                widget.click1 = !widget.click1;
              },
            ));
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
        style: TextStyle(fontSize: 18),
      )
    ]);
  }
}
