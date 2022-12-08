import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';

class ProductProvider with ChangeNotifier {
  CollectionReference prodcutRef =
      FirebaseFirestore.instance.collection("Products");
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();

  getAllProducts() {
    return prodcutRef.snapshots();
  }

  Future<String> uploadImage(File file, String id) async {
    final mountainsRef = storageRef.child("images");
    await mountainsRef.child("$id.jpg").putFile(file);
    return await mountainsRef.child("$id.jpg").getDownloadURL();
  }

  addProuct(Product product) async {
    String id = prodcutRef.doc().id;
    product.id = id;

    if (product.image != null) {
      product.image = await uploadImage(product.image, product.id);

      return await prodcutRef.doc(id).set(product.toJson());
    } else {
      product.image = 'default';
      return await prodcutRef.doc(id).set(product.toJson());
    }
  }

  updateProuct(Product product) async {
    await prodcutRef.doc(product.id).set(product.toJson());
  }

  deleteProduct(String id) async {
    await prodcutRef.doc(id).set(null);
  }
}
