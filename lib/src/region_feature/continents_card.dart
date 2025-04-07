import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/constants/index.dart';

class ContinentCard extends StatelessWidget {
  final String continent;

  const ContinentCard({super.key, required this.continent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {context.go('/continents/$continent')},
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!, width: 1)),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 110,
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
              continents[continent]['name'],
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
