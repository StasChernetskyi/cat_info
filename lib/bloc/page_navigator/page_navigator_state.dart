import 'package:flutter/material.dart';

abstract class PageNavigatorState {}

class CatListPageState extends PageNavigatorState {}

class CatInfoPageState extends PageNavigatorState {
  final dynamic catInfo;

  CatInfoPageState({@required this.catInfo}) : assert(catInfo != null);
}
