import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildStyle(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text(
            'Cooking up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildStyle('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildStyle('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ]),
    );
  }
}
