import 'package:flutter/material.dart';
import 'package:pusyantek/pages/home.page.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/login';
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  var _isLoading = false;

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
                        : Text('Sig In'),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(Duration(seconds: 2)).then((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      });
                    },
                  ),
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
