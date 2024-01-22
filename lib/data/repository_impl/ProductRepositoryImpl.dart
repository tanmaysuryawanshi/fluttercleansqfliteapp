import 'dart:developer';

import 'package:flutterproductclean/data/local/product_db.dart';
import 'package:flutterproductclean/data/model/productmodel.dart';
import 'package:flutterproductclean/domain/repository/ProductRepository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDb productDb;
  ProductRepositoryImpl({required this.productDb});

  @override
  Future<List<ProductDataModel>> getProducts() {
    try {
      return productDb.fetchAll();
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<void> addProduct(String name, String price) async {
    try {
      await productDb.create(name: name, price: price);
    } catch (e) {
      log(e.toString());
    }
  }
}
