import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:some_form_api/some_form_api.dart';

class SomeFormDataRequestFailure implements Exception {}

class SomeFormDataNotFoundFailure implements Exception {}


class SomeFormApiClient {
  SomeFormApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'some-form-api.url';

  final http.Client _httpClient;

  Future<SomeFormData> locationSearch(String query) async {
    final someFormDataRequest = Uri.https(
      _baseUrl,
      '/some/endpoint',
    );

    final someFormDataResponse = await _httpClient.get(someFormDataRequest);

    if (someFormDataResponse.statusCode != 200) {
      throw SomeFormDataRequestFailure();
    }

    final someFormDataJson = jsonDecode(someFormDataResponse.body) as Map;

    if (!someFormDataJson.containsKey('results')) throw SomeFormDataNotFoundFailure();

    final results = someFormDataJson['results'] as List;

    if (results.isEmpty) throw SomeFormDataNotFoundFailure();

    return SomeFormData.fromJson(results.first as Map<String, dynamic>);
  }

  void close() {
    _httpClient.close();
  }
}
