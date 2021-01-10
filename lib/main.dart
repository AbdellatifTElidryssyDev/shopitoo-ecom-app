import 'package:shopitoo/constants.dart';
import 'package:shopitoo/models/product.dart';
import 'package:shopitoo/provider/adminMode.dart';
import 'package:shopitoo/provider/cartItem.dart';
import 'package:shopitoo/provider/modelHud.dart';
import 'package:shopitoo/screens/admin/OrdersScreen.dart';
import 'package:shopitoo/screens/admin/addProduct.dart';
import 'package:shopitoo/screens/admin/adminHome.dart';
import 'package:shopitoo/screens/admin/editProduct.dart';
import 'package:shopitoo/screens/admin/manageProduct.dart';
import 'package:shopitoo/screens/admin/order_details.dart';
import 'package:shopitoo/screens/login_screen.dart';
import 'package:shopitoo/screens/signup_screen.dart';
import 'package:shopitoo/screens/user/CartScreen.dart';
import 'package:shopitoo/screens/user/homePage.dart';
import 'package:shopitoo/screens/user/productInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading....'),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                create: (context) => ModelHud(),
              ),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),
              ChangeNotifierProvider<AdminMode>(
                create: (context) => AdminMode(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: isUserLoggedIn ? HomePage.id : LoginScreen.id,
              routes: {
                OrderDetails.id: (context) => OrderDetails(),
                OrdersScreen.id: (context) => OrdersScreen(),
                CartScreen.id: (context) => CartScreen(),
                ProductInfo.id: (context) => ProductInfo(),
                EditProduct.id: (context) => EditProduct(),
                ManageProducts.id: (context) => ManageProducts(),
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => HomePage(),
                AdminHome.id: (context) => AdminHome(),
                AddProduct.id: (context) => AddProduct(),
              },
            ),
          );
        }
      },
    );
  }
}
