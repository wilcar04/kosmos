import 'package:kosmos/src/list_feature/country_detail.dart';
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

  Future<List<CountryDetail>> fetchCountryDetail(String name) async {
    final url = Uri.https(
        'www.restcountries.com', "/v3.1/name/$name", {'fullText': 'true'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> listOfJson = jsonDecode(response.body) as List;
      return listOfJson.map((json) => CountryDetail.fromJson(json)).toList();
    } else {
      throw Exception('Not found');
    }
  }

  Future<String> fetchCountryPhoto(String name) async {
    final url = Uri.https('www.pixabay.com', "/api/", {
      'key': '49497773-9334095235e71db736f28b2e3',
      'q': name,
      'orientation': 'horizontal',
      'per_page': '4'
    });

    final headers = {
      'key': '49497773-9334095235e71db736f28b2e3',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> listOfJson = jsonDecode(response.body)['hits'];
      // return [''];
      return listOfJson[0]['webformatURL'] as String;
    } else {
      throw Exception('Not found');
    }
  }
}
