import 'package:flutter/material.dart';

class ImageShoes {
  ImageShoes(
    this.image,
    this.color,
  );
  final String image;
  final Color color;
}

class Shoes {
  Shoes(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.listImage,
    this.listSize,

    //define listSize
  );
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageShoes> listImage;
  //size
  var listSize = [7, 8, 9, 10, 11, 12];
}
