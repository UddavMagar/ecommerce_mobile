import 'category.dart';
import 'inventory.dart';

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  List<Category>? category;
  Inventory? inventory;
  String? createdAt;
  String? modifiedAt;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.inventory,
      this.createdAt,
      this.modifiedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    inventory = json['inventory'] != null
        ? new Inventory.fromJson(json['inventory'])
        : null;
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.inventory != null) {
      data['inventory'] = this.inventory!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}




