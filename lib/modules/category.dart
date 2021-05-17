import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id, title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color=Colors.orange,
  });
}
