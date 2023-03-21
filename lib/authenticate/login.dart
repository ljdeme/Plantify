import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantify/home_page.dart';
import '../widgets/widgets.dart';
import 'package:plantify/authenticate/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late bool _validateEmail = false, _validatePassword = false;

  // Handle login
  Future<void> login(String email, String password) async {
    bool isSignedIn;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      isSignedIn = true;
    } on FirebaseAuthException catch (error) {
      isSignedIn = false;
    }
    isLoggedIn(isSignedIn);
  }

  // Check if login successful
  Future<void> isLoggedIn(bool successfulLogin) async {
    if (successfulLogin == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('Incorrect Email or Password');
    }
  }

  // check if user is verified
  //Future<void> isVerified() {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _emailController,
                autocorrect: false,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                    hintText: 'example@email.com'),
                keyboardType: TextInputType.emailAddress,
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _passwordController,
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: 'password'),
                keyboardType: TextInputType.visiblePassword,
              )),
          SizedBox(
            height: 50,
            width: 250,
            child: GreenButton(
              onPressed: () {
                login(_emailController.text, _passwordController.text);
              },
              text: 'Login',
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account? "),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                child: const Text("Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ])
        ])));
  }
}
