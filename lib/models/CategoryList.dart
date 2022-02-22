class CategoryList {
  List<Category> categoryList;
  CategoryList({this.categoryList});
  factory CategoryList.fromJson(List<dynamic> listJson){
    List<Category> categoryList =
    listJson.map((value) => Category.fromJson(value)).toList();
    return CategoryList(categoryList: categoryList);
  }
}

class Category {
  String name;
  String photo;
  Category({
    this.name,
    this.photo
  });
  factory Category.fromJson(Map<String, dynamic> json){
    return Category(name: json['name'], photo: json['photo']);
  }
}