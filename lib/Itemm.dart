import 'dart:ffi';

import 'package:qualifflutter/Review.dart';

class Itemm {
  String productName;
  String price;
  String image;
  String description;
  List<Review> review;
  Itemm(
      {required this.productName,
      required this.description,
      required this.price,
      required this.image,
      required this.review});
}
