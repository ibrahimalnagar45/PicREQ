import 'package:flutter/material.dart';

import '../views/general_page.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GeneralView(
                        type: type,
                      );
                    },
                  ),
                );
              },
              child: Text(
                type,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          )
        ],
      ),
    );
  }
}
