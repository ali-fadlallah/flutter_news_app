import 'package:flutter/material.dart';
import 'package:news/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  const CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(30),
          topLeft: const Radius.circular(30),
          bottomLeft: Radius.circular(index.isEven ? 0 : 30),
          bottomRight: Radius.circular(index.isEven ? 30 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/${category.imagePath}',
            height: 100,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
