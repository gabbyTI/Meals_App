// import 'dart:html';

import 'package:flutter/material.dart';
import '../pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).accentColor.withOpacity(0.3),
                  Theme.of(context).accentColor,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildDrawerMenuItem(
            context: context,
            icon: Icons.restaurant,
            title: 'Meals',
            controller: _selectDrawerMenuItem,
          ),
          _buildDrawerMenuItem(
            context: context,
            icon: Icons.settings,
            title: 'Filters',
            routeName: FiltersPage.routeName,
            controller: _selectDrawerMenuItem,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerMenuItem(
      {BuildContext context,
      IconData icon,
      String title,
      String routeName = '/',
      Function controller}) {
    return ListTile(
      autofocus: true,
      onTap: () => controller(context, routeName),
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  void _selectDrawerMenuItem(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
