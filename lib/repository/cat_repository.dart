import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/repository/cat_api_client.dart';

class CatRepository {
  final CatApiClient catApiClient;

  CatRepository({@required this.catApiClient}) : assert(catApiClient != null);

  Future<List<Cat>> getCats() async {
    List<Cat> cats = await catApiClient.fetchCatsInfo();
    cats.forEach((cat) async {
      cat.imageUrl = await catApiClient.fetchCatImageUrl(breed_id: cat.id);
    });

    return cats;
  }
}
