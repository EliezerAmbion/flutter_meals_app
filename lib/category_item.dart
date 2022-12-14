import 'package:flutter/material.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({super.key, required this.title, required this.color});

  void selectCategory(BuildContext ctx) {
    // this is a feature of flutter
    // Navigator is used to navigate between screens
    // NOTE: remember that in app, pages are stacked
    // when you navigate to a certain page, it will add (push) that screen,
    // and when you go back, it remove (pop) it from the list.
    // NOTE: you need to pass MaterialPageRoute when you are pushing a screen.
    Navigator.of(ctx).push(
      MaterialPageRoute(
        // you used _ here because you don't need the context.
        // you can also use context instead of _
        builder: (_) {
          return const CategoryMealsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // you need anonymous function here and pass the context to selectCategory() so that flutter knows the information of specific page.
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
