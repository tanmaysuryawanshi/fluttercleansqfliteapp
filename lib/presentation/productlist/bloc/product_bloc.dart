import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/productmodel.dart';
import '../../../domain/usecase/ProductUsecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUsecase productUsecase;
  List<ProductDataModel>? productList = [];
  ProductBloc({required this.productUsecase}) : super(ProductInitial()) {
    on<ProductInitalEvent>(productInitialEvent);
    on<AddProductButtonClickedEvent>(addProductButtonClicked);
    on<SubmitButtonClickedEvent>(submitButtonClickedEvent);
  }

  Future<void> productInitialEvent(
      ProductInitalEvent event, Emitter<ProductState> emit) async {
    log('start');
    emit(ProductLoadingState());

    print('start');
    try {
      await productUsecase.getData().then((value) {
        productList = value;

        emit(ProductLoadedSuccessState(products: value));
      });
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> addProductButtonClicked(
      AddProductButtonClickedEvent event, Emitter<ProductState> emit) {
    log('add button clicked');
    emit(NavigateToAddProductState());
  }

  FutureOr<void> submitButtonClickedEvent(
      SubmitButtonClickedEvent event, Emitter<ProductState> emit) async {
    print('start');
    try {
      productList =
          await productUsecase.addData(event.name, event.price).then((value) {
        productUsecase.getData().then((products) {
          productList = products;
        });
      });
      emit(ProductLoadedSuccessState(products: productList ?? []));
    } catch (e) {
      print(e);
      emit(ProductErrorState());
    }
  }
}
