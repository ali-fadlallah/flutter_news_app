import 'package:flutter/material.dart';
import 'package:news/models/category.dart';
import 'package:news/ui/home_screen/categories_screen/category_item.dart';

typedef OnCategoryClicked = void Function(Category category);

class CategoryScreen extends StatelessWidget {
  final List<Category> category = Category.getAllCategory();

  final OnCategoryClicked onCategoryClicked;

  CategoryScreen(this.onCategoryClicked, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(category[index]);
                },
                child: CategoryItem(category: category[index], index: index),
              ),
              itemCount: category.length,
            ),
          )
        ],
      ),
    );
  }
}
