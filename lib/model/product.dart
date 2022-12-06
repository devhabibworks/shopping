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
}

toJson(Product product) {}
