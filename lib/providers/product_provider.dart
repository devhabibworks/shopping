import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  CollectionReference ref = FirebaseFirestore.instance.collection("Products");

  getAllProducts() {
    return ref.snapshots();
  }
}
