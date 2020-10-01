import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:cat_info/model/cat.dart';

class CatApiClient {
  static const String baseUrl = 'https://api.thecatapi.com/v1';
  static const String api_key = '6b442799-876d-4387-9678-39f75678feb3';
  static const int limit = 30;
  final Client httpClient;

  CatApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<dynamic>> fetchCatsInfo() async {
    final catsInfoUrl = '$baseUrl/breeds?page=0&api_key=$api_key&limit=$limit';
    final catsInfoResponse = await this.httpClient.get(catsInfoUrl);

    if (catsInfoResponse.statusCode != 200) {
      throw Exception('error getting cats info');
    }

    final catsInfoJson = jsonDecode(catsInfoResponse.body);
    return catsInfoJson
        .map((catInfoJson) => Cat.fromJson(catInfoJson))
        .toList();
  }

  Future<String> fetchCatImageUrl({@required String breed_id}) async {
    final catImageUrl =
        '$baseUrl/images/search?limit=1&breed_id=$breed_id&api_key=$api_key';
    final catImageResponse = await this.httpClient.get(catImageUrl);

    if (catImageResponse.statusCode != 200) {
      throw Exception('error getting cats info image');
    }

    final catImageJson = jsonDecode(catImageResponse.body);
    return catImageJson.first['url'];
  }
}
