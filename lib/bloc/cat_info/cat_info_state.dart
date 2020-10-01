import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';

abstract class CatInfoState {}

class CatInfoInitial extends CatInfoState {}

class CatInfoLoadInProgress extends CatInfoState {}

class CatInfoLoadSuccess extends CatInfoState {
  final List<Cat> cats;

  CatInfoLoadSuccess({@required this.cats}) : assert(cats != null);
}

class CatInfoLoadFailure extends CatInfoState {}
