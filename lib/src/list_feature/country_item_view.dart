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
              height: double.infinity, // Ocupar toda la altura disponible
              width: null, // Ancho automático
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Adjust the radius as needed
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              item.name,
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
                    maxLines: 2,
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
