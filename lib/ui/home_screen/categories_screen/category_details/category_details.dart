import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';

import '../../../../models/category.dart';
import '../../source_screen/sources_tab.dart';

class CategoryDetails extends StatelessWidget {
  Category categoryModel;

  CategoryDetails(this.categoryModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: ApiManager.getSources(categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
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
                          ApiManager.getSources(categoryModel.id);
                        },
                        child: const Text('Try again!'))
                  ],
                ),
              ),
            );
          }

          var sourceList = snapshot.data?.sources;
          return SourcesTab(sourceList ?? []);
        },
      ),
    );
  }
}

//SourcesTab(sourceList)
