import 'package:cart_hive/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito prro"),
      ),
      body: BlocProvider(
        create: (context) => CartBloc()..add(LoadProductsEvent()),
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state is ElementRemovedState) {
              // show snackbar
            }
          },
          builder: (context, state) {
            if (state is ElementsLoadedState) {
              if (state.prodsList.isEmpty || state.prodsList == null) {
                return Text("data");
              } else {
                return ListView.builder(
                  itemCount: state.prodsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(), //key para cada elemento
                      onDismissed: (direction) {
                        // if (direction == DismissDirection.startToEnd) {
                        BlocProvider.of<CartBloc>(context)
                            .add(RemoveProductEvent(element: index));
                        // }
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                        alignment: Alignment.centerLeft,
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                        alignment: Alignment.centerLeft,
                      ),
                      child: ListTile(
                        title: Text("${state.prodsList[index].name}"),
                        subtitle: Text("${state.prodsList[index].price}"),
                      ),
                    );
                  },
                );
              }
            } else
              return Center(
                child: Text("No hay elementos"),
              );
          },
        ),
      ),
    );
  }
}
