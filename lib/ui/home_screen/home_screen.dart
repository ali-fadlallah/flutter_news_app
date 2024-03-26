import 'package:flutter/material.dart';
import 'package:news/models/category.dart';
import 'package:news/ui/home_screen/categories_screen/category_details/category_details.dart';
import 'package:news/ui/home_screen/categories_screen/category_screen.dart';
import 'package:news/ui/home_screen/home_drawer/home_drawer.dart';
import 'package:news/ui/home_screen/news_screen/news_search.dart';
import 'package:news/ui/home_screen/settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = 'News App';
  bool isCategoryDetailsShowed = false;

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
          title: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            isCategoryDetailsShowed == true
                ? IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, NewsSearch.routeName);
                    },
                  )
                : Text(''),
          ],
        ),
        drawer: HomeDrawer(onMenuItemSelected),
        body: selectedMenuItem,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedMenuItem = CategoryScreen(onCategoryClicked);
  }

  late Widget selectedMenuItem;

  void onMenuItemSelected(ItemSelected itemSelected) {
    Navigator.pop(context);
    switch (itemSelected) {
      case ItemSelected.categories:
        appBarTitle = 'News App';
        isCategoryDetailsShowed = false;
        selectedMenuItem = CategoryScreen(onCategoryClicked);
        setState(() {});
        break;
      case ItemSelected.settings:
        appBarTitle = 'Settings';
        isCategoryDetailsShowed = false;
        selectedMenuItem = const SettingsScreen();
        setState(() {});
        break;
    }
  }

  void onCategoryClicked(Category category) {
    selectedMenuItem = CategoryDetails(category);
    appBarTitle = category.title;
    isCategoryDetailsShowed = true;
    setState(() {});
  }
}
