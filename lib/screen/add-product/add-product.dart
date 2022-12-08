import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/providers/product_provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController quantityController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    nameController = TextEditingController(text: "");
    descriptionController = TextEditingController(text: "");
    priceController = TextEditingController(text: "100");
    quantityController = TextEditingController(text: "5");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "name",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: descriptionController,
                    validator: ((value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "description is Required";
                      }
                    }),
                    decoration: const InputDecoration(
                      hintText: "write your note",
                      helperText: "required",
                    )),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.purple,
                  onPressed: () async {
                    await productProvider.addProuct(Product(
                        image: "",
                        name: nameController.text,
                        description: descriptionController.text,
                        quantity: quantityController.text,
                        price: priceController.text));

                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Added Succeffluy"),
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "upload",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
