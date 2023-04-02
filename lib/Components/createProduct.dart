import 'package:adidas_app/Models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  var listType = [
    'Sneakers', 'Dép', 'Bóng rổ', 'Tập luyện', 'Bóng đá', 'Sportswear',
    'Giày thể thao khác'
  ];
  var currentItemSelected = 'Sneakers';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  // final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _subDescController = TextEditingController();

  final _productss = FirebaseFirestore.instance.collection('products').doc();

  Future<void> createProduct(Product product) async {
    product.id = _productss.id;

    final json = product.toJson();
    await _productss.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Thêm Sản Phẩm'.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              controller: _nameController,
              decoration: decoration('Name'),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: _priceController,
              decoration: decoration('Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: _imageController,
              decoration: decoration('Image'),
            ),
            const SizedBox(height: 24,),
            // TextField(
            //   controller: _typeController,
            //   decoration: decoration('Type'),
            // ),
            DropdownButton<String>(
              items: listType.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                    value: dropDownStringItem ,
                    child: Text(dropDownStringItem)
                );
              }).toList(),
              onChanged: (String? newValueSelected) {
                _onDropDownItemSelected(newValueSelected!);
              },
              value: currentItemSelected,
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: _descController,
              decoration: decoration('Description'),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: _subDescController,
              decoration: decoration('SubDescription'),
            ),
            const SizedBox(height: 32,),
            ElevatedButton(
                onPressed: () {
                  final product = Product(
                      image: _imageController.text,
                      name: _nameController.text,
                      // type: _typeController.text,
                      type: currentItemSelected,
                      description: _descController.text,
                      subDescription: _subDescController.text,
                      price: _priceController.text,
                  );

                  createProduct(product);
                  
                  Navigator.pop(context);
                },
                child: Text('Create')
            ),
          ],
        ),
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder()
  );

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }
}
