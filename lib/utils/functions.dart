import 'package:doks/utils/global_keys.dart';
import 'package:flutter/material.dart' show SnackBar, Text;

void showSnackBar(String message) {
  scaffoldMessengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
