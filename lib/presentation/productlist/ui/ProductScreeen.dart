import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproductclean/presentation/AddProduct/bloc/add_product_bloc.dart';
import 'package:flutterproductclean/presentation/AddProduct/ui/AddProductScreen.dart';

import '../bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductBloc>(context).add(ProductInitalEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => current is! ProductActionState,
      listener: (context, state) {
        if (state is NavigateToAddProductState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        }
      },
      builder: (context, state) {
        log(state.toString());
        if (state is ProductLoadedSuccessState) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Products'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<ProductBloc>(context)
                      .add(AddProductButtonClickedEvent());
                },
                child: const Icon(Icons.add),
              ),
              body: (state.products.length != 0)
                  ? ListView(
                      children: List.generate(
                      BlocProvider.of<ProductBloc>(context).productList!.length,
                      (index) => Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                BlocProvider.of<ProductBloc>(context)
                                    .productList![index]
                                    .name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                  "${BlocProvider.of<ProductBloc>(context).productList![index].price} Rs"),
                            ],
                          ),
                        ),
                      ),
                    ))
                  : Center(
                      child: Text('No items currently Add Items'),
                    ));
        } else if (state is ProductErrorState) {
          return Scaffold(body: Center(child: Text("Error")));
        } else if (state is ProductLoadingState) {
          return Scaffold(body: CircularProgressIndicator());
        }

        return Scaffold(body: Text("Something went Wrong"));
      },
    );
  }
}
