import 'package:kosmos/src/list_feature/country_item.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CountryService {
  Future<List<CountryItem>> fetchCountryList() async {
    final url = Uri.https('www.restcountries.com', '/v3.1/independent',
        {'status': 'true', 'fields': 'name,capital,flags,cca3'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> listOfJson = jsonDecode(response.body) as List;
      return listOfJson.map((json) => CountryItem.fromJson(json)).toList();
    } else {
      throw Exception('Not found');
    }
  }
}
