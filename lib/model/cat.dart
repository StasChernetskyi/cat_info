import 'package:flutter/cupertino.dart';

class Cat {
  final String id;
  final String name;
  final String temperament;
  final String lifeSpan;
  final String altNames;
  final String wikipediaUrl;
  final String origin;
  final String weightImperial;
  String imageUrl;

  Cat({
    @required this.id,
    @required this.name,
    @required this.temperament,
    @required this.lifeSpan,
    @required this.altNames,
    @required this.wikipediaUrl,
    @required this.origin,
    @required this.weightImperial,
    this.imageUrl,
  });

  static Cat fromJson(dynamic json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      altNames: json['alt_names'],
      wikipediaUrl: json['wikipedia_url'],
      origin: json['origin'],
      weightImperial: json['weight_imperial'],
      imageUrl: "",
    );
  }
}
