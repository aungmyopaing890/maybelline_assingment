import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maybelline/core/models/product.dart';
import 'package:maybelline/core/services/product_service.dart';
import 'package:maybelline/core/viewmodels/base_model.dart';
import 'package:maybelline/locator.dart';

class CartModel extends BaseModel {
  final ProductService _productService = locator<ProductService>();

  //private
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //getters
  get formKey => _formKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get addressController => _addressController;

  String? validateName(String name) {
    return name.isEmpty || name.isEmpty ? 'Invalid name' : null;
  }

  String? validatePhone(String? phone) {
    return phone!.isEmpty || phone.isEmpty ? 'Invalid phone' : null;
  }

  String? validateAddress(String address) {
    return address.isEmpty || address.isEmpty ? 'Invalid name' : null;
  }

  void add(Product product) {
    _productService.add(product);
    notifyListeners();
  }

  void minus(Product product) {
    _productService.minus(product);
    notifyListeners();
  }

  Future<void> makeOrder(Product product) async {
    if (_formKey.currentState!.validate()) {
      final doc = FirebaseFirestore.instance.collection('orders').doc();
      final josn = {
        'id': doc.id,
        'name': _nameController.text,
        'price': product.price,
        'priceSign': product.priceSign,
        'address': _addressController.text,
        'quantity': _addressController.text,
        'phone': _phoneController.text,
        'total': product.total
      };
      await doc.set(josn);
      _nameController.text = "";
      _addressController.text = "";
      _phoneController.text = "";
      product.quantity = 1;
      product.total = product.price;
    }
  }
}
