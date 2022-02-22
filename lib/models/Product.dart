import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  var num;
  final Color color;
  final Color color2;
  final Color color3;

  Product({
    this.id,
    this.num,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.color2,
    this.color3,
  });
}
List<Product> cart_record =[];
List<Product> products = [
  Product(
      id: 1,
      title: "衛生紙",
      price: 234,
      size: 500,
      num: 1,
      description: "舒潔衛生紙，500抽，經濟實惠的好選擇",
      image: "assets/images/purpletissue.png",
      color: Color(0XFFB39DDB),
      color2: Color(0XFFFFEE58),
      color3: Color(0XFF80CBC4)),
  Product(
      id: 2,
      title: "濕紙巾",
      price: 234,
      size: 20,
      num: 1,
      description: "防疫期間好選擇",
      image: "assets/images/wetpaper.png",
      color: Color(0XFF4FC3F7)),
  Product(
      id: 3,
      title: "酒精",
      price: 234,
      size: 4000,
      num: 1,
      description: "防疫必需品!",
      image: "assets/images/4000ML.png",
      color: Color(0XFFBDBDBD)),
  Product(
      id: 4,
      title: "行動電源",
      price: 234,
      size: 11,
      num: 1,
      description: "確保手機隨時有電!",
      image: "assets/images/power.png",
      color: Color(0XFF757575)),
  Product(
      id: 5,
      title: "口罩",
      price: 234,
      size: 12,
      num: 1,
      description: "防疫期間必需品",
      image: "assets/images/orangemask.png",
      color: Color(0XFFFFB300)),
  Product(
    id: 6,
    title: "毛巾",
    price: 234,
    size: 12,
    num: 1,
    description: "可以拿來當擦屁布",
    image: "assets/images/towel.png",
    color: Color(0XFFB3E5FC),
  ),
];

