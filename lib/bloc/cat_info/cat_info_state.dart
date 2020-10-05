import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';

abstract class CatInfoState {}

class CatInfoLoadInProgress extends CatInfoState {}

class CatInfoLoadSuccess extends CatInfoState {
  final List<Cat> catsInfo;

  CatInfoLoadSuccess({@required this.catsInfo}) : assert(catsInfo != null);
}

class CatInfoLoadFailure extends CatInfoState {}
