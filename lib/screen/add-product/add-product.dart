import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _imageFile;
  final _picker = ImagePicker();

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
    Future<void> _pickImageFromGallery() async {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 200,
        maxWidth: 200,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }

    Future<void> _pickImageFromCamera() async {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 200,
        maxWidth: 200,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      ButtonBar(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.photo_camera),
                            onPressed: () async => _pickImageFromCamera(),
                            tooltip: 'Shoot picture',
                          ),
                          IconButton(
                            icon: const Icon(Icons.photo),
                            onPressed: () async {
                              _pickImageFromGallery();
                            },
                            tooltip: 'Pick from gallery',
                          ),
                        ],
                      ),
                      (_imageFile != null)
                          ? Image.file(_imageFile!)
                          : const Placeholder(
                              fallbackHeight: 200,
                            )
                    ],
                  ),
                  const SizedBox(height: 16),
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
                        hintText: "write description",
                        helperText: "required",
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      hintText: "price",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: quantityController,
                    decoration: const InputDecoration(
                      hintText: "quntity",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.purple,
                    onPressed: () async {
                      await productProvider.addProuct(Product(
                          image: _imageFile,
                          name: nameController.text,
                          description: descriptionController.text,
                          quantity: quantityController.text,
                          price: priceController.text));

                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
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
      ),
    );
  }
}
