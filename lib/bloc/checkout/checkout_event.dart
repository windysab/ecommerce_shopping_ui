part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class AddToCartEvent extends CheckoutEvent {
  final Product product;
  AddToCartEvent({
    required this.product,
  });
}

class RemoveFromCartEvent extends CheckoutEvent {
  final Product product;
  RemoveFromCartEvent({
    required this.product,
  });
}

class DeleteFromCartEvent extends CheckoutEvent {
  final Product product;
  DeleteFromCartEvent({
    required this.product,
  });
}