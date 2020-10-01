import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_info/bloc/page_navigator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCardWidget extends StatelessWidget {
  final catInfo;

  CatCardWidget({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: InkWell(
        onTap: () {
          BlocProvider.of<PageNavigatorBloc>(context).add(
            PageNavigatorToCatInfoEvent(
              catInfo: catInfo,
            ),
          );
        },
        child: Card(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: catInfo.imageUrl,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    catInfo.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
