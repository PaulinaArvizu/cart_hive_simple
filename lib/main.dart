import 'package:cart_hive/home/home_page.dart';
import 'package:cart_hive/model/product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //inicializar antes de crear la app
  WidgetsFlutterBinding.ensureInitialized();
  //local storage
  final _localStorage = await getApplicationSupportDirectory();
  Hive
    ..init(_localStorage.path)
    ..registerAdapter(CarritoAdapter());
  //open box
  await Hive.openBox("Carrito");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
