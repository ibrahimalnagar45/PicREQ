 import 'package:flutter/material.dart';

void showSnakBar(context, String message ){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
 }