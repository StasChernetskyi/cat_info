import 'package:flutter/material.dart';

abstract class PageNavigatorEvent {}

class PageNavigatorToCatInfoEvent extends PageNavigatorEvent {
  final dynamic catInfo;

  PageNavigatorToCatInfoEvent({@required this.catInfo})
      : assert(catInfo != null);
}

class PageNavigatorToCatListEvent extends PageNavigatorEvent {}
