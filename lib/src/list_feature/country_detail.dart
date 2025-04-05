class CountryDetail {
  const CountryDetail({
    required this.code,
    required this.name,
    required this.officialName,
    required this.capital,
    required this.imageUrl,
    required this.imageAlt,
    required this.currency,
    required this.region,
    required this.subRegion,
    required this.flagEmoji,
    required this.population,
    required this.area,
    required this.coatOfArmsUrl,
  });

  final String code;
  final String name;
  final String officialName;
  final String capital;
  final String imageUrl;
  final String imageAlt;

  final String currency;
  final String region;
  final String subRegion;
  final String flagEmoji;
  final int population;
  final double area;
  final String coatOfArmsUrl;

  factory CountryDetail.fromJson(Map<String, dynamic> json) {
    return CountryDetail(
      code: json['cca3'] ?? '',
      name: json['name']['common'] ?? '',
      officialName: json['name']['official'] ?? '',
      capital: (json['capital'] as List<dynamic>?)?.first ?? 'Unknown',
      imageUrl: json['flags']['png'] ?? '',
      imageAlt: json['flags']['alt'] ?? '',
      currency: json['currencies']?.keys.first ?? 'Unknown',
      region: json['region'] ?? '',
      subRegion: json['subregion'] ?? '',
      flagEmoji: json['flag'] ?? '',
      population: json['population'] ?? 0,
      area: json['area'] ?? 0,
      coatOfArmsUrl: json['coatOfArms']['png'] ?? '',
    );
  }
}
