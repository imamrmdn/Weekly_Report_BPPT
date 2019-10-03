import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/pages/home.page.dart';
import 'package:pusyantek/pages/login.page.dart';
import 'package:pusyantek/pages/register.page.dart';
import 'package:pusyantek/provider/auth.provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'pusyantekbppt',
          theme: ThemeData(primarySwatch: Colors.teal),
          home: auth.isAuthenticated ? HomePage() : LoginPage(),
          routes: {
            LoginPage.routeName: (BuildContext context) => LoginPage(),
            RegisterPage.routeName: (BuildContext context) => RegisterPage(),
            HomePage.routeName: (BuildContext context) => HomePage(),
          },
        ),
      ),
    );
  }
}
