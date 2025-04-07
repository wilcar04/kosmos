import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/list_feature/country_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.public,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Welcome to',
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
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: () {
                context.go('/continents');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 120,
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.asset(
                        'assets/images/world.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Try searching countries by any continent!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 32.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Countries to discover',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          CountryListView(),
        ]),
      ),
    ));
  }
}
