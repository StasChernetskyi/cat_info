import 'package:flutter/material.dart';

abstract class CatInfoState {}

class CatInfoInitial extends CatInfoState {}

class CatInfoLoadInProgress extends CatInfoState {}

class CatInfoLoadSuccess extends CatInfoState {
  final List<dynamic> catsInfo;

  CatInfoLoadSuccess({@required this.catsInfo}) : assert(catsInfo != null);
}

class CatInfoLoadFailure extends CatInfoState {}
