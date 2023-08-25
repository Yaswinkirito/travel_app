import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/pages/calender.dart';
import 'package:travel_app/pages/details.dart';
import 'package:travel_app/pages/profile.dart';
import 'package:travel_app/pages/starting_page.dart';
import 'package:travel_app/pages/view_all.dart';

import 'main.dart';

final routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) =>
            MyHomePage(size: MediaQuery.of(context).size)),
    GoRoute(
        path: '/home',
        builder: (context, state) => Home(size: MediaQuery.of(context).size)),
    GoRoute(
      path: '/calender',
      builder: (context, state) => const Calender(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const Profile(),
    ),
    GoRoute(
        path: '/detail/:id1/:id2/:id3/:id4',
        name: 'detail',
        builder: (context, state) => Detail(
            title: state.pathParameters['id1'].toString(),
            description: state.pathParameters['id2'].toString(),
            rate: double.parse(state.pathParameters['id3'].toString()),
            image: state.pathParameters['id4'].toString())),
    GoRoute(path: '/view', builder: (context, state) => ViewAll())
  ],
);
