part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class AddProductDataToDb extends AddProductEvent {
  final String name;
  final String price;
  AddProductDataToDb({required this.name, required this.price});
}
