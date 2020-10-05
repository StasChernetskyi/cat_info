import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/widget/cat_card_widget.dart';

class CatListWidget extends StatelessWidget {
  final List<Cat> catsInfo;

  CatListWidget({@required this.catsInfo}) : assert(catsInfo.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catsInfo.length,
      itemBuilder: (context, index) => CatCardWidget(catInfo: catsInfo[index]),
    );
  }
}
