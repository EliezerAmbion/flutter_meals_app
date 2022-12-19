import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int) selectPage;
  final int selectedPageIndex;

  const BottomNavBar({
    super.key,
    required this.selectPage,
    required this.selectedPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: selectPage,
      backgroundColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      // currentIndex is to tell the bottomNavbar what to highlight
      currentIndex: selectedPageIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favourites',
        ),
      ],
    );
  }
}
