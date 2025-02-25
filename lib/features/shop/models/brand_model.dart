import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      this.productCount});

  static BrandModel empty() => BrandModel(
      id: '', name: '', image: '', isFeatured: false, productCount: 0);

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'isFeatured': isFeatured
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return BrandModel.empty();
    } else {
      return BrandModel(
          id: data['Id'],
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          productCount: data['ProductCount'] ?? 0,
          isFeatured: data['isFeatured'] ?? false
          );
    }
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      //map json to the model

      return BrandModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['isFeatured'] ?? false,
          productCount: data['ProductCount'] ?? 0);
    } else {
      return BrandModel.empty();
    }
  }
}
