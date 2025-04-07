import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/region_feature/continents_card.dart';

class ContinentsView extends StatelessWidget {
  const ContinentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.go('/'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            children: [
              Text(
                'Please select a continent to filter your search.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    ContinentCard(
                        imageAsset: '', name: 'Europe', route: 'europe')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
