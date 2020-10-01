import 'package:cat_info/widget/cat_card_widget.dart';
import 'package:flutter/material.dart';

class CatListWidget extends StatelessWidget {
  final List<dynamic> catsInfo;

  CatListWidget({@required this.catsInfo}) : assert(catsInfo.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catsInfo.length,
      itemBuilder: (context, index) => CatCardWidget(catInfo: catsInfo[index]),
    );
  }
}
