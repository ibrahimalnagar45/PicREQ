import 'package:flutter/material.dart'; 

import '../constants.dart';
import '../views/favorites_view.dart';
import 'custom_drawer_tile.dart'; 

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  final List<String> categories = const [
    'backgrounds',
    'fashion',
    'nature',
    'science',
    'education',
    'feelings',
    'health',
    'people',
    'religion',
    'places',
    'animals',
    'industry',
    'computer',
    'food',
    'sports',
    'transportation',
    'travel',
    'buildings',
    'business',
    'music'
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    kPrimaryAppName,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.light_mode)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4),
            child: GestureDetector(
              onTap: () {
                // Store().Print();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FavortiesView();
                    },
                  ),
                );
              },
              child:const Text(
                'favorites',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 280,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return DrawerTile(type: categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
