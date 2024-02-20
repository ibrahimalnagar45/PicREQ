import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/image_cards_builder.dart'; 

class GeneralView extends StatefulWidget {
  const GeneralView({super.key, this.type = 'general'});

  static String id = 'generalPage';
  final String type;
  @override
  State<GeneralView> createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(kPrimaryAppName),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ImagesBuilder(
          type: widget.type,
        ),
      ),
    );
  }
}
