import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatInfoWidget extends StatelessWidget {
  final dynamic catInfo;

  CatInfoWidget({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildImageWidget(),
            ),
            Expanded(
              flex: 3,
              child: _buildInfoListWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoListWidget() {
    return Container(
      child: Column(
        children: [
          Text(catInfo.temperament),
          Text(catInfo.lifeSpan),
          Text(catInfo.wikipediaUrl),
          Text(catInfo.origin),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            imageUrl: catInfo.imageUrl,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
        ],
      ),
    );
  }
}
