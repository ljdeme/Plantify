import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantify/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
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
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: 'hi')));
              },
              child: const Text(
                'Login',
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account? "),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text("Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ])
        ])));
  }
}
