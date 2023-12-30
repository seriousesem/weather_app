
import 'package:flutter/material.dart';

buildAppBar(String title, Widget? leading) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.black54),
    ),
    leading: leading,
  );
}