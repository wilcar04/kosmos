import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/list_feature/country_detail.dart';
import 'package:kosmos/src/list_feature/widgets/info_cell_country.dart';

/// Displays detailed information about a SampleItem.
class CountryDetailsView extends StatefulWidget {
  const CountryDetailsView({super.key, required this.name});

  final String name;

  @override
  State<CountryDetailsView> createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends State<CountryDetailsView> {
  CountryDetail? country;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> franceJson = {
      "cca3": "FRA",
      "name": {"common": "France"},
      "capital": ["Paris"],
      "flags": {
        "png": "https://flagcdn.com/w320/fr.png",
        "alt": "The flag of France..."
      },
      "currencies": {
        "EUR": {"name": "Euro"}
      },
      "region": "Europe",
      "subregion": "Western Europe",
      "flag": "🇫🇷",
      "population": 67391582,
      "area": 551695,
      "coatOfArms": {
        "png": "https://mainfacts.com/media/images/coats_of_arms/fr.png"
      },
      "maps": {"googleMaps": "https://goo.gl/maps/g7QxxSFsWyTPKuzd7"}
    };

    // Creating an instance of Country from JSON
    country = CountryDetail.fromJson(franceJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
        body: country != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 186,
                          width: double.infinity,
                          child: Image.network(
                            'https://media.architecturaldigest.com/photos/66a951edce728792a48166e6/3:2/w_7950,h_5300,c_limit/GettyImages-955441104.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -48,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 8,
                                  children: [
                                    SizedBox(
                                      height: 82,
                                      width: null,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          country!.imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        country!.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 72.0, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${country!.region}, ",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                TextSpan(
                                  text: country!.subRegion,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: null,
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              primary: false,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 8,
                              childAspectRatio: 2,
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              children: [
                                InfoCellCountry(
                                  icon: Icons.star,
                                  title: 'Capital',
                                  data: country!.capital,
                                ),
                                InfoCellCountry(
                                  icon: Icons.attach_money,
                                  title: 'Currency',
                                  data: country!.currency,
                                ),
                                InfoCellCountry(
                                  icon: Icons.people,
                                  title: 'Population',
                                  data: country!.population.toString(),
                                ),
                                InfoCellCountry(
                                  icon: Icons.square_foot,
                                  title: 'Area',
                                  data: country!.area.toString(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${country!.flagEmoji}  ${country!.code}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  SizedBox(
                                      height: 200,
                                      child: Image.network(
                                          country!.coatOfArmsUrl,
                                          fit: BoxFit.cover)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: Text('Not found')));
  }
}
