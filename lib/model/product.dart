import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  var id;
  var name;
  var description;
  var price;
  var quantity;
  var image;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.quantity,
      this.image});

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        price = json["price"],
        quantity = json["quantity"],
        image = json["image"];

  Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    id = data["id"];
    name = data["name"];
    description = data["description"];
    price = data["price"];
    image = data["image"];
    quantity = data["quantity"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      'image': image,
      "quantity": quantity,
    };
  }
}
