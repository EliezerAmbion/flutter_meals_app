import 'package:flutter/material.dart';

import '/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  buildSectionTitle(BuildContext context, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 35, bottom: 5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                children: [
                  buildSectionTitle(context, 'Ingredients'),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            selectedMeal.ingredients[index],
                          )),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                  buildSectionTitle(context, 'Steps'),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        Divider(color: Theme.of(context).colorScheme.primary),
                      ],
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // pop remove the screen that is on top of the stack
          // you can pass any data in pop
          // this is just a use-case for popping a screen.
          // max, in udemy haven't thought of anything that can be popped so
          // he just created it here.
          Navigator.of(context).pop(mealId);
        },
        child: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
