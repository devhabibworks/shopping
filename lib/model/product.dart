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

  Product.fromSnapshot(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        price = json["price"],
        quantity = json["quantity"];

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
