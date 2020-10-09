import 'package:cart_hive/cart/cart_page.dart';
import 'package:cart_hive/home/bloc/home_bloc.dart';
import 'package:cart_hive/home/item_home.dart';
import 'package:cart_hive/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;
  List<Widget> _prodsFakeData;

  @override
  void initState() {
    _prodsFakeData = [
      ItemHome(
        prod: Product(
          idProd: "1",
          picture:
              "https://elpoderdelconsumidor.org/wp-content/uploads/2019/07/coca-cola-cherry-sabor-cereza-355-ml.jpg",
          name: "Coca-cola",
          price: 15.50,
        ),
        addToCart: _addProduct,
      ),
      ItemHome(
        prod: Product(
          idProd: "2",
          picture:
              "https://supercostablanca.es/7430-thickbox_default/fanta-naranja-33cl.jpg",
          name: "Fanta",
          price: 11.30,
        ),
        addToCart: _addProduct,
      ),
      ItemHome(
        prod: Product(
          idProd: "3",
          picture:
              "https://www.cocacola.es/content/dam/GO/sprite/spain/home/SP_1,5L_BA_800x654.jpg",
          name: "Sprite",
          price: 10.50,
        ),
        addToCart: _addProduct,
      ),
      ItemHome(
        prod: Product(
          idProd: "4",
          picture:
              "https://www.coca-colamexico.com.mx/content/dam/journey/mx/es/private/brand-detail/fresca/Fresca_Full.png",
          name: "Fresca",
          price: 10.59,
        ),
        addToCart: _addProduct,
      ),
      ItemHome(
        prod: Product(
          idProd: "5",
          picture:
              "https://sc01.alicdn.com/kf/HTB1nWM9LXXXXXbvXVXXq6xXFXXXx.jpg",
          name: "Delawere punch",
          price: 8.90,
        ),
        addToCart: _addProduct,
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    Hive.close();
    super.dispose();
  }

  void _addProduct(Product prod) {
    _homeBloc.add(AddToCartEvent(product: prod));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          _homeBloc = HomeBloc();
          return _homeBloc;
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ElementAddedState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Agregado al carrito"),
                  ),
                );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  snap: false,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("e-tienda"),
                    background: Image.network(
                      "https://i.imgur.com/o6szmY0.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CartPage()),
                        );
                      },
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _prodsFakeData,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
