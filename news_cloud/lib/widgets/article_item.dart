import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_cloud/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: article.image??'',
          progressIndicatorBuilder:
              (context, url, downloadProgress) =>
              CircularProgressIndicator(
                  value: downloadProgress.progress),
          errorWidget: (context, url, error) =>
              Image.asset(
                'assets/images/img.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                fit: BoxFit.fill,
              ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 10, 12, 5),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            article.title ?? 'No Title',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            article.description ??
                'No Description',
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
