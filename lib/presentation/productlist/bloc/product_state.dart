part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedSuccessState extends ProductState {
  final List<ProductDataModel> products;
  ProductLoadedSuccessState({
    required this.products,
  });
}

class ProductErrorState extends ProductState {}

class NavigateToAddProductState extends ProductActionState {}
