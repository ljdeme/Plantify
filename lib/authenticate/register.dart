import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantify/main.dart';
import 'package:plantify/widgets/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  late bool _validateFirstName = false,
      _validateLastName = false,
      _validateEmail = false,
      _validatePassword = false;

  // Handle register
  Future<void> register(String email, String password) async {
    bool isSignedIn;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      isSignedIn = true;
    } on FirebaseAuthException catch (error) {
      isSignedIn = false;
    }
    //isLoggedIn(isSignedIn);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: _firstNameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'first name',
                        hintText: 'first name',
                        errorText:
                            _validateFirstName ? 'cannot be empty' : null),
                    keyboardType: TextInputType.name)),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: _lastNameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'last name',
                        hintText: 'last name',
                        errorText:
                            _validateLastName ? 'cannot be empty' : null),
                    keyboardType: TextInputType.name)),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'email',
                        hintText: 'example@email.com',
                        errorText: _validateEmail ? 'cannot be empty' : null),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    autocorrect: false)),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: _passwordController,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'password',
                        hintText: 'password',
                        errorText:
                            _validatePassword ? 'cannot be empty' : null))),
            SizedBox(
              height: 50,
              width: 250,
              child: GreenButton(
                onPressed: () {
                  setState(() {
                    _firstNameController.text.isEmpty
                        ? _validateFirstName = true
                        : _validateFirstName = false;
                    _lastNameController.text.isEmpty
                        ? _validateLastName = true
                        : _validateLastName = false;
                    _emailController.text.isEmpty
                        ? _validateEmail = true
                        : _validateEmail = false;
                    _passwordController.text.isEmpty
                        ? _validatePassword = true
                        : _validatePassword = false;
                  });
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyHomePage(title: 'hi')));
                  });
                },
                text: 'Register',
              ),
            ),
          ],
        )));
  }
}
