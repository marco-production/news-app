
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';

//Capitalize
String capitalize(String name) {
  return "${name[0].toUpperCase()}${name.substring(1)}";
}

//If image of article is null return other image
ImageProvider articleImage(String? image) {
  if (image == null) {
    return const AssetImage('assets/no-image.png');
  } else {
    return NetworkImage(image);
  }
}