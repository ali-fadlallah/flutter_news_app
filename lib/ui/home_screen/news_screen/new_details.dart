import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/responses/News/Articles.dart';
import 'package:news/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NewDetails extends StatefulWidget {
  static const String routeName = 'new_details';

  NewDetails({Key? key}) : super(key: key);

  @override
  State<NewDetails> createState() => _NewDetailsState();
}

class _NewDetailsState extends State<NewDetails> {
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: article.urlToImage ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/img_no_image.png'),
                  ),
                ),
                Text(
                  article.source?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  article.title ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(article.description ?? ''),
                Text(article.content ?? ''),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child:
                      Text(CustomUtils.formatDate(article.publishedAt ?? '')),
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      launchInBrowserView(Uri.parse('${article.url}'));
                    }),
                    child: const Text('View full article'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
