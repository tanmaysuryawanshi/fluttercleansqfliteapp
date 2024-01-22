import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/ProductUsecase.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductScreenState> {
  final ProductUsecase productUsecase;
  AddProductBloc({required this.productUsecase})
      : super(AddProductScreenInitial()) {
    on<AddProductEvent>((event, emit) {});
    on<AddProductDataToDb>(addProductDataToDb);
  }

  FutureOr<void> addProductDataToDb(
      AddProductDataToDb event, Emitter<AddProductScreenState> emit) async {
    emit(AddProductLoading());
    try {
      await productUsecase.addData(event.name, event.price).then((value) {
        emit(NavigateFromAddProductScreen());
      });
    } catch (e) {
      emit(AddProductScreenInitial());
    }
  }
}
