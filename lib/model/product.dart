import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  var id;
  var name;
  var description;
  var price;
  var quantity;

  Product({this.id, this.name, this.description, this.price, this.quantity});

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        price = json["price"],
        quantity = json["quantity"];

  Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    id = data["id"];
    name = data["name"];
    description = data["description"];
    price = data["price"];
    quantity = data["quantity"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "quantity": quantity,
    };
  }
}
