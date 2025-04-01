import 'package:flutter/material.dart';

class InfoCellCountry extends StatelessWidget {
  const InfoCellCountry({
    super.key,
    required this.data,
    required this.title,
    required this.icon,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 9,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(data)
          ],
        ),
      ],
    );
  }
}
