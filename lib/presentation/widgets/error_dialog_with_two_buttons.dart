import 'package:flutter/material.dart';

import '../../utils/constants.dart';

buildErrorDialogWithTwoButtons({
  required String error,
  required Function() noButtonAction,
  required Function() yesButtonAction,
}) {
  return AlertDialog(
    title: const Text(
      Titles.errorDialogTitle,
      textAlign: TextAlign.center,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
    content: Row(
      children: [
        Expanded(
          child: Text(
            error,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    contentTextStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
    actions: [
      Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: OutlinedButton(
              onPressed: noButtonAction,
              child: const Text(Titles.noButtonTitle),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: OutlinedButton(
              onPressed: yesButtonAction,
              child: const Text(Titles.yesButtonTitle),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    ],
  );
}
