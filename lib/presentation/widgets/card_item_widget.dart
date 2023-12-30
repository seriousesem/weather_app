import 'package:flutter/material.dart';

buildCardItemWidget(String title, String data, String? units) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '$data ${units ?? ''}',
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
