import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/pages/home.page.dart';
import 'package:pusyantek/pages/register.page.dart';
import 'package:pusyantek/provider/auth.provider.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/login';
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;

  handleOnSubmit() async {
    try {
      setState(() => _isLoading = true);
      await Provider.of<Auth>(context)
          .login(_emailController.text, _passwordController.text);
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } catch (error) {
      print(error);
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Image.asset('assets/Pusyantek1.png'),
                SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    ),
                    labelText: 'Email',
                    hintText: 'Masukan Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    ),
                    hintText: 'Masukan Kata Sandi',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  splashColor: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textTheme: ButtonTextTheme.primary,
                  buttonColor: Colors.teal,
                  minWidth: double.infinity,
                  height: 65,
                  child: RaisedButton(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : Text('Sign In'),
                    onPressed: handleOnSubmit,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Do not have an account?'),
                    SizedBox(width: 5),
                    InkWell(
                      child: Text(
                        'Register here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed(RegisterPage.routeName),
                    )
                  ],
                ),
                SizedBox(height: 100),
                Text('Version 0.0.1'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
