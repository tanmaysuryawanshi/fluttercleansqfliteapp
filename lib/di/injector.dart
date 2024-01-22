import 'package:flutterproductclean/data/local/product_db.dart';
import 'package:flutterproductclean/data/repository_impl/ProductRepositoryImpl.dart';
import 'package:flutterproductclean/domain/repository/ProductRepository.dart';
import 'package:flutterproductclean/domain/usecase/ProductUsecase.dart';
import 'package:flutterproductclean/presentation/AddProduct/bloc/add_product_bloc.dart';

import 'package:get_it/get_it.dart';

import '../presentation/productlist/bloc/product_bloc.dart';

final injector = GetIt.instance;
Future<void> initializeDependencies() async {
  final ProductDb productDb = ProductDb();
  injector.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productDb: productDb),
  );
  injector.registerLazySingleton<ProductUsecase>(
      () => ProductUsecase(productRepository: injector()));
  injector.registerFactory<ProductBloc>(
      () => ProductBloc(productUsecase: injector()));
  injector.registerFactory<AddProductBloc>(
      () => AddProductBloc(productUsecase: injector()));
}
