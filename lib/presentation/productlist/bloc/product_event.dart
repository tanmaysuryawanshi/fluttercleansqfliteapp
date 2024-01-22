part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ProductInitalEvent extends ProductEvent {}

class AddProductButtonClickedEvent extends ProductEvent {}

class SubmitButtonClickedEvent extends ProductEvent {
  final String name;
  final String price;
  SubmitButtonClickedEvent({required this.name, required this.price});
}
