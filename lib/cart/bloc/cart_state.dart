part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class ElementRemovedState extends CartState {}

class ElementsLoadedState extends CartState {
  final List<Product> prodsList;

  ElementsLoadedState({@required this.prodsList});
  @override
  List<Object> get props => [prodsList];
}
