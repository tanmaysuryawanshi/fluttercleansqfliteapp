class ProductDataModel {
  final String name;

  final String price;

  ProductDataModel({
    required this.name,
    required this.price,
  });

  factory ProductDataModel.fromDb(Map<String, dynamic> map) => ProductDataModel(
      name: map['name']?.toString() ?? '',
      price: map['price']?.toString() ?? '');
}
