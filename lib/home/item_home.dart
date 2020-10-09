import 'package:cart_hive/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemHome extends StatelessWidget {
  final Product prod;
  final ValueChanged<Product> addToCart;
  ItemHome({
    Key key,
    @required this.prod,
    @required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Row(
        children: [
          Image.network(
            prod.picture,
            height: 64,
            width: 64,
          ),
          SizedBox(width: 16),
          Column(
            children: [
              Text(
                "${prod.name}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "\$${prod.price}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 8),
              MaterialButton(
                onPressed: () => addToCart(prod),
                child: Text("Al carrito"),
                color: Colors.blue[100],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
