import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';

class ProductProvider with ChangeNotifier {
  CollectionReference prodcutRef =
      FirebaseFirestore.instance.collection("Products");

  getAllProducts() {
    return prodcutRef.snapshots();
  }

  addProuct(Product product) async {
    String id = prodcutRef.doc().id;
    product.id = id;
    return await prodcutRef.doc(id).set(product.toJson());
  }

  updateProuct(Product product) async {
    await prodcutRef.doc(product.id).set(product.toJson());
  }

  deleteProduct(String id) async {
    await prodcutRef.doc(id).set(null);
  }
}
