
import 'package:flutter/material.dart';

buildButtonBackWidget(Function() buttonAction){
  return IconButton(
      onPressed: buttonAction,
      icon: const Icon(Icons.arrow_back_ios_new_outlined)
  );
}