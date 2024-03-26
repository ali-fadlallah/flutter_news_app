import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/responses/News/Articles.dart';
import 'package:news/ui/home_screen/news_screen/new_details.dart';
import 'package:news/utils/utils.dart';

class NewItem extends StatelessWidget {
  Article article;

  NewItem(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewDetails.routeName, arguments: article);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: article.urlToImage ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/img_no_image.png'),
              ),
            ),
            Text(
              article.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(article.description ?? ''),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(CustomUtils.formatDate(article.publishedAt ?? '')),
            )
          ],
        ),
      ),
    );
  }
}
