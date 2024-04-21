import 'package:flutter/material.dart';

showSnack(BuildContext context, text) {
  Scaffold.of(context).showBottomSheet(
    (context) {
      return SnackBar(content: new Text('$text'));
    },
  );
}
