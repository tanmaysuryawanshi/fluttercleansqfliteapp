import '../../data/model/productmodel.dart';

abstract class ProductRepository {
  Future<List<ProductDataModel>> getProducts();
  Future<void> addProduct(String name, String price);
}
