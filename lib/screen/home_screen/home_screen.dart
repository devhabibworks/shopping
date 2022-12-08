import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/providers/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: productProvider.getAllProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: const EdgeInsets.only(bottom: 70, top: 16),
                  reverse: true,
                  itemCount: snapshot.data!.docs.length, // error
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index]; // error
                    Product product = Product.fromDocument(ds);
                    return ListTile(
                      title: Text("${product.name}"),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
