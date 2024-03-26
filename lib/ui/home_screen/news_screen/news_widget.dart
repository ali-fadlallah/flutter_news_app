import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/responses/Sources/Source.dart';
import 'package:news/ui/home_screen/news_screen/new_item.dart';

class NewsWidget extends StatelessWidget {
  final Source source;

  NewsWidget(this.source, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: ApiManager.getNews(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${snapshot.data?.message}'),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getNews(source.id ?? '');
                        },
                        child: const Text('Try again!'))
                  ],
                ),
              ),
            );
          }

          var articlesList = snapshot.data?.articles;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return NewItem(articlesList[index]);
            },
            itemCount: articlesList!.length,
          );
        },
      ),
    );
  }
}
