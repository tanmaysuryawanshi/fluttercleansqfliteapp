import 'package:flutterproductclean/data/model/productmodel.dart';
import 'package:flutterproductclean/domain/repository/ProductRepository.dart';

class ProductUsecase {
  final ProductRepository productRepository;
  ProductUsecase({required this.productRepository});
  Future<List<ProductDataModel>> getData() async {
    return await productRepository.getProducts();
  }

  Future<void> addData(String name, String price) async {
    productRepository.addProduct(name, price);
  }
}
