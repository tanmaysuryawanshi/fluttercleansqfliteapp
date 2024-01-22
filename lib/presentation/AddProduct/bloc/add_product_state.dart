part of 'add_product_bloc.dart';

@immutable
abstract class AddProductScreenState {}

class AddProductScreenInitial extends AddProductScreenState {}

class AddProductLoading extends AddProductScreenState {}

class NavigateFromAddProductScreen extends AddProductScreenState {}
