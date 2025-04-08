import 'dart:async';
import 'dart:io';

import 'package:kosmos/src/list_feature/country_detail.dart';
import 'package:kosmos/src/list_feature/country_item.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class CountryService {
  Future<List<CountryItem>> fetchCountryList(String? continent) async {
    late String route;
    String field = '';

    if (continent != null) {
      if (continent.contains('America')) {
        continent = 'America';
        field = ',subregion';
      }
      route = 'region/$continent';
      field = '$field,independent';
    } else {
      route = 'independent';
    }

    final url = Uri.https('www.restcountries.com', '/v3.1/$route',
        {'fields': 'name,capital,flags,cca3$field'});

    final r = RetryOptions(maxAttempts: 5);
    final response = await r.retry(() => http.get(url),
        retryIf: (e) =>
            e is SocketException ||
            e is TimeoutException ||
            e is HandshakeException);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final List<dynamic> listOfJson = jsonDecode(decoded) as List;
      return listOfJson.map((json) => CountryItem.fromJson(json)).toList();
    } else {
      throw Exception('Not found');
    }
  }

  Future<List<CountryDetail>> fetchCountryDetail(String name) async {
    final url = Uri.https(
        'www.restcountries.com', "/v3.1/name/$name", {'fullText': 'true'});

    final r = RetryOptions(maxAttempts: 5);
    final response = await r.retry(() => http.get(url),
        retryIf: (e) =>
            e is SocketException ||
            e is TimeoutException ||
            e is HandshakeException);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final List<dynamic> listOfJson = jsonDecode(decoded) as List;
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
      'per_page': '4',
      'image_type': 'photo'
    });

    final headers = {
      'key': '49497773-9334095235e71db736f28b2e3',
    };

    final r = RetryOptions(maxAttempts: 5);
    final response = await r.retry(() => http.get(url, headers: headers),
        retryIf: (e) =>
            e is SocketException ||
            e is TimeoutException ||
            e is HandshakeException);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final List<dynamic> listOfJson = jsonDecode(decoded)['hits'];
      // return [''];
      return listOfJson[0]['webformatURL'] as String;
    } else {
      throw Exception('Not found');
    }
  }
}
