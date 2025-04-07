import 'package:flutter/material.dart';
import 'package:kosmos/src/components/loader.dart';
import 'package:kosmos/src/list_feature/country_item_view.dart';
import 'package:kosmos/src/services/country_service.dart';

import 'country_item.dart';

/// Displays a list of SampleItems.
class CountryListView extends StatefulWidget {
  const CountryListView({
    super.key,
    this.continent,
  });

  static const routeName = '/';
  final String? continent;

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final countryService = CountryService();

  List<CountryItem> items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCountryList();
  }

  Future<void> _fetchCountryList() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<CountryItem> list =
          await countryService.fetchCountryList(widget.continent);

      if (widget.continent != null) {
        if (widget.continent!.contains('America')) {
          bool isSouthAmerica = widget.continent!.contains('South');

          // Logical gate XNOR to whether South America is the subregion or not
          list = list
              .where((country) =>
                  (country.subRegion == 'South America' && isSouthAmerica) ||
                  (!(country.subRegion == 'South America') && !isSouthAmerica))
              .toList();
        }
      }

      setState(() {
        items = list;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.toString(),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox(height: 400, child: Loader())
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            restorationId: 'sampleItemListView',
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return CountryItemView(
                item: item,
              );
            },
          );
  }
}
