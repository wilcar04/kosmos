import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosmos/src/components/loader.dart';
import 'package:kosmos/src/list_feature/country_detail.dart';
import 'package:kosmos/src/list_feature/widgets/info_cell_country.dart';
import 'package:kosmos/src/services/color_service.dart';
import 'package:kosmos/src/services/country_service.dart';

/// Displays detailed information about a SampleItem.
class CountryDetailsView extends StatefulWidget {
  const CountryDetailsView({super.key, required this.name});

  final String name;

  @override
  State<CountryDetailsView> createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends State<CountryDetailsView> {
  final countryService = CountryService();
  final colorService = ColorService();

  CountryDetail? country;
  String countryPhoto =
      'https://media.architecturaldigest.com/photos/66a951edce728792a48166e6/3:2/w_7950,h_5300,c_limit/GettyImages-955441104.jpg';
  bool _isLoading = false;
  Color dominantColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _fetchCountryDetail(widget.name);
    _fetchCountryPhoto(widget.name);
  }

  Future<void> _getColorFromImage(String imageUrl) async {
    final color = await colorService.getDominantColor(imageUrl);
    if (mounted && color != null && color.computeLuminance() < 0.8) {
      setState(() {
        dominantColor = color;
      });
    }
  }

  Future<void> _fetchCountryPhoto(String name) async {
    try {
      final photoUrl = await countryService.fetchCountryPhoto(name);
      if (mounted) {
        setState(() {
          countryPhoto = photoUrl;
        });
      }
    } catch (error) {
      setState(() {
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

  Future<void> _fetchCountryDetail(String name) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final list = await countryService.fetchCountryDetail(name);
      if (mounted) {
        setState(() {
          country = list[0];
          _isLoading = false;
        });
      }
      _getColorFromImage(list[0].imageUrl);
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
              onPressed: () => context.pop(),
            ),
          ),
        ),
        body: _isLoading
            ? Loader()
            : country != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 240,
                              width: double.infinity,
                              child: Image.network(
                                countryPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: -48,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 8,
                                      children: [
                                        SizedBox(
                                          height: 82,
                                          width: null,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                          padding:
                              EdgeInsets.only(top: 72.0, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                country!.officialName,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "${country!.region}, ${country!.subRegion}",
                                style: Theme.of(context).textTheme.bodyMedium,
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
                                      dominantColor: dominantColor,
                                      icon: Icons.star,
                                      title: 'Capital',
                                      data: country!.capital,
                                    ),
                                    InfoCellCountry(
                                      dominantColor: dominantColor,
                                      icon: Icons.attach_money,
                                      title: 'Currency',
                                      data: country!.currency,
                                    ),
                                    InfoCellCountry(
                                      dominantColor: dominantColor,
                                      icon: Icons.people,
                                      title: 'Population',
                                      data: country!.population.toString(),
                                    ),
                                    InfoCellCountry(
                                      dominantColor: dominantColor,
                                      icon: Icons.square_foot,
                                      title: 'Area',
                                      data: '${country!.area.toString()} km2',
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
                              ),
                              SizedBox(
                                height: 50,
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
