import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/home_feature/home_view.dart';
import 'package:kosmos/src/list_feature/country_details_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
        routes: [
          GoRoute(
            path: 'recipeDetail/:name',
            builder: (BuildContext context, GoRouterState state) {
              final countryName = state.pathParameters["name"] ?? '';
              return CountryDetailsView(name: countryName);
            },
          )
        ])
  ],
);
