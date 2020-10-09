import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_hive/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //referencia a box previamente abierta (en main)
  Box _carritoBox = Hive.box("Carrito");

  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // DONE: cargar productos
    List<Product> _productList = List();
    if (event is LoadProductsEvent) {
      try {
        for (var i = 0; i < _carritoBox.length; i++) {
          Product prod = _carritoBox.getAt(i) as Product;
          if (prod == null) {
            throw Exception();
          }
          _productList.add(prod);
        }
        yield ElementsLoadedState(prodsList: _productList);
      } catch (e) {
        yield ElementsLoadedState(prodsList: _productList);
      }
    } else if (event is RemoveProductEvent) {
      try {
        _productList.removeAt(event.element);
        _carritoBox.deleteAt(event.element);

        yield ElementsLoadedState(prodsList: _productList);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
