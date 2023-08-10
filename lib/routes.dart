import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/pages/details.dart';
import 'package:travel_app/pages/starting_page.dart';

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
    GoRoute(path: '/detail', builder: (context, state) => Detail())
  ],
);
