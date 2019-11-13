import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task_02_category_widget/category.dart';
import 'package:task_02_category_widget/unit.dart';

final _backgoundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        color: _baseColors[i],
        name: _categoryNames[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    final listView = Container(
      color: _backgoundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backgoundColor,
    );
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

  _buildCategoryWidgets(List<Category> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(name: '$categoryName Unit $i', conversion: i.toDouble());
    });
  }
}
