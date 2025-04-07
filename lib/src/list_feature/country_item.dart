class CountryItem {
  const CountryItem(
      {required this.code,
      this.isIndependent,
      this.subRegion,
      required this.name,
      required this.capital,
      required this.imageUrl,
      required this.imageAlt});

  final String code;
  final String name;
  final String capital;
  final String imageUrl;
  final String imageAlt;
  final String? subRegion;
  final bool? isIndependent;

  factory CountryItem.fromJson(Map<String, dynamic> json) {
    return CountryItem(
      code: json['cca3'] ?? '',
      name: json['name']['common'] ?? '',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'No capital',
      imageUrl: json['flags']['png'] ?? '',
      imageAlt: json['flags']['alt'] ?? '',
      subRegion: json['subregion'],
      isIndependent: json['independent'] ?? true,
    );
  }
}
