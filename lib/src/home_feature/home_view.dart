import 'package:flutter/material.dart';
import 'package:kosmos/src/list_feature/country_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.public,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Hi, Wilson',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Discover the world through data',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Countries to discover',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    CountryListView(),
                  ]),
            )));
  }
}
