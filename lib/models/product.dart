import 'package:flutter/material.dart';

import '../models/location_data.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavourite;
  final String userEmail;
  final String userId;
  final LocationData location;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,
    @required this.userEmail,
    @required this.userId,
    @required this.location,
    this.isFavourite = false
    });
}