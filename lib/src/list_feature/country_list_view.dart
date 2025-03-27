import 'package:flutter/material.dart';
import 'package:kosmos/src/list_feature/country_item_view.dart';

import 'country_item.dart';
import 'country_details_view.dart';

/// Displays a list of SampleItems.
class CountryListView extends StatelessWidget {
  const CountryListView({
    super.key,
    this.items = const [
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
      CountryItem(
          name: "France",
          capital: "Paris",
          code: "FRA",
          imageAlt: "",
          imageUrl: "https://flagcdn.com/w320/gd.png"),
    ],
  });

  static const routeName = '/';

  final List<CountryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Providing a restorationId allows the ListView to restore the
      // scroll position when a user leaves and returns to the app after it
      // has been killed while running in the background.
      shrinkWrap: true, // Makes the ListView take only the needed space
      physics: NeverScrollableScrollPhysics(),
      restorationId: 'sampleItemListView',
      itemCount: items.length,

      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return SizedBox(
          height: 150,
          child: CountryItemView(
            item: item,
          ),
        );
      },
    );
  }
}
