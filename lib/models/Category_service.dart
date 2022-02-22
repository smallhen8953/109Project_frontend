import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:the_help_list/models/CategoryList.dart';

Future<String> _loadDataJson() async {
  return await rootBundle.loadString('assets/data/category.json');
}
Future<CategoryList> decodeDataList() async{
  String categoryListJson = await _loadDataJson();
  List<dynamic> list = json.decode(categoryListJson);
  CategoryList categoryList = CategoryList.fromJson(list);
  return categoryList;
}