import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/constants/index.dart';
import 'package:kosmos/src/list_feature/country_list_view.dart';

class ContinentFilterView extends StatelessWidget {
  final String continent;

  const ContinentFilterView({super.key, required this.continent});

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
              onPressed: () => context.go('/continents'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).shadowColor
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      'assets/images/${continents[continent]['asset']}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Showing results for ${continents[continent]['name']}.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 24,
                ),
                CountryListView(continent: continent)
              ],
            ),
          ),
        ));
  }
}
