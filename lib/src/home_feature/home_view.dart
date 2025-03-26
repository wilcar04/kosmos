import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Hi, Wilson',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Discover the world through data',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ])));
  }
}
