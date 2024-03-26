import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home_screen/news_screen/new_item.dart';

class NewsSearch extends StatefulWidget {
  static const String routeName = 'news_search';

  NewsSearch({Key? key}) : super(key: key);

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  final TextEditingController _searchController = TextEditingController();
  var focusNode = FocusNode();
  bool isVisiable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
          )),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextField(
            focusNode: focusNode,
            textInputAction: TextInputAction.search,
            controller: _searchController,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 18),
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              hintText: 'Search Article....',
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              suffixIcon: Icon(Icons.search,
                  size: 25, color: Theme.of(context).colorScheme.primary),
              prefixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: Icon(Icons.clear,
                      size: 25, color: Theme.of(context).colorScheme.primary)),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
            onSubmitted: (value) {
              // Perform search functionality here
              _searchController.text = value;
              isVisiable = true;
              setState(() {});
            },
          ),
        ),
        body: Visibility(
          visible: isVisiable,
          child: Center(
            child: FutureBuilder(
              future: ApiManager.searchArticle(_searchController.text ?? ''),
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
                                ApiManager.searchArticle(
                                    _searchController.text ?? '');
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
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.requestFocus();
  }
}
