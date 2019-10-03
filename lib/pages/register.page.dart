import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/provider/auth.provider.dart';

class RegisterPage extends StatefulWidget {
  static final routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  var _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleOnSubmit() async {
    try {
      setState(() => _isLoading = true);

      await Provider.of<Auth>(context).register(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );

      Navigator.of(context).pop();
    } catch (error) {
      print(error);
      setState(() => _isLoading = false);
    }
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
                SizedBox(height: 30),
                Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
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
                          labelText: 'Password',
                          hintText: 'Masukan Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                              width: 2,
                            ),
                          ),
                          labelText: 'Nama',
                          hintText: 'Masukan Nama',
                          prefixIcon: Icon(
                            Icons.person,
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
                              : Text('Sign Up'),
                          onPressed: _handleOnSubmit,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
