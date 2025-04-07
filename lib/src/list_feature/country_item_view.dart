import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/list_feature/country_item.dart';

class CountryItemView extends StatelessWidget {
  const CountryItemView({required this.item, super.key});

  final CountryItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            minVerticalPadding: 20,
            leading: SizedBox(
              width: 100,
              height: 60,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.network(item.imageUrl),
                  ),
                ),
              ),
            ),
            title: Text(
              item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.blueGrey,
                  size: 18,
                ),
                Expanded(
                  child: Text(
                    item.capital,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            trailing: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    height: 34,
                    width: 34,
                    color: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ))),
            onTap: () {
              context.go('/recipeDetail/${item.name}');
            },
          ),
        ],
      ),
    );
  }
}
