import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/category_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Categories {
  static List<Category> categories = [
    Category(
      type: 'Carpenters',
      icon: FaIcon(FontAwesomeIcons.hammer, color: Colors.grey.shade800, size: 18),
    ),
    Category(
      type: 'Electricians',
      icon: FaIcon(FontAwesomeIcons.boltLightning, color: Colors.grey.shade800, size: 18),
    ),
    Category(
      type: 'Plumbers',
      icon: FaIcon(FontAwesomeIcons.wrench, color: Colors.grey.shade800, size: 18),
    ),
    Category(
      type: 'Masons',
      icon: FaIcon(FontAwesomeIcons.toolbox, color: Colors.grey.shade800, size: 18),
    ),
    Category(
      type: 'Gardeners',
      icon: FaIcon(FontAwesomeIcons.leaf, color: Colors.grey.shade800, size: 18),
    ),
    Category(
      type: 'Painters',
      icon: FaIcon(FontAwesomeIcons.paintRoller, color: Colors.grey.shade800, size: 18),
    ),
  ];
}






