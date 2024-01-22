import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproductclean/presentation/AddProduct/bloc/add_product_bloc.dart';
import 'package:flutterproductclean/presentation/productlist/bloc/product_bloc.dart';
import 'package:flutterproductclean/presentation/productlist/ui/ProductScreeen.dart';

import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => injector<ProductBloc>()),
    BlocProvider(create: (context) => injector<AddProductBloc>()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductScreen(),
    );
  }
}
