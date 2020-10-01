import 'package:flutter/cupertino.dart';

class Cat {
  final String id;
  final String name;
  final String temperament;
  final String lifeSpan;
  final String wikipediaUrl;
  final String origin;
  String imageUrl;

  Cat({
    @required this.id,
    @required this.name,
    @required this.temperament,
    @required this.lifeSpan,
    @required this.wikipediaUrl,
    @required this.origin,
    this.imageUrl,
  });

  static Cat fromJson(dynamic json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      wikipediaUrl: json['wikipedia_url'],
      origin: json['origin'],
      imageUrl: "",
    );
  }
}
