import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproductclean/presentation/AddProduct/bloc/add_product_bloc.dart';
import 'package:flutterproductclean/presentation/productlist/ui/ProductScreeen.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerPrice;

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<ProductBloc>(context).add(ProductInitalEvent());
    _controllerName = TextEditingController();
    _controllerName.addListener(() {
      setState(() {});
    });
    _controllerPrice = TextEditingController();
    _controllerPrice.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductBloc, AddProductScreenState>(
      listener: (context, state) {
        if (state is NavigateFromAddProductScreen) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(hintText: "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerPrice,
                  decoration: InputDecoration(hintText: "Price"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<AddProductBloc>(context).add(
                        AddProductDataToDb(
                            name: _controllerName.text,
                            price: _controllerPrice.text));
                  },
                  child: Text('Add Product'))
            ],
          ),
        );
      },
    );
  }
}
