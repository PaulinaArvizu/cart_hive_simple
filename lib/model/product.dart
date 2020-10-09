import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1, adapterName: "CarritoAdapter")
class Product {
  @HiveField(0)
  final String idProd;
  @HiveField(1)
  final String picture;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final String descrip;
  @HiveField(5)
  final bool favorite;
  @HiveField(6)
  final int ranking;
  @HiveField(7)
  final int amount;

  Product({
    @required this.idProd,
    @required this.picture,
    @required this.name,
    @required this.price,
    this.descrip = "Producto en oferta",
    this.favorite = false,
    this.ranking = 5,
    this.amount = 1,
  });
}
