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

class SlideText extends StatelessWidget {
  const SlideText({super.key, required this.s, required this.i});
  final String s;
  final double i;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: (Text(
        s,
        style: TextStyle(fontSize: i, fontWeight: FontWeight.w400),
      )),
    );
  }
}
