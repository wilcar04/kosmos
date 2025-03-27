import 'package:flutter/material.dart';
import 'package:kosmos/src/list_feature/country_details_view.dart';
import 'package:kosmos/src/list_feature/country_item.dart';

class CountryItemView extends StatelessWidget {
  const CountryItemView(
      {
      // Key key,
      // this.name,
      // this.capital,
      // this.code,
      // this.imageAlt,
      // this.imageUrl,
      required this.item,
      super.key});

  final CountryItem item;

  // final String name;
  // final String capital;
  // final String code;
  // final String imageAlt;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 140,
        ),
        title: Text(item.name),
        subtitle: Text(item.capital),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CountryDetailsView(),
            ),
          );
          // Navigator.restorablePushNamed(
          //           context,
          //           CountryDetailsView.routeName,
          //         );
        },
      ),
    );
  }
}
