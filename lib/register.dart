import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantify/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sign-Up Page')),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: _firstNameController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'first name',
                        hintText: 'first name'),
                    keyboardType: TextInputType.name)),
            Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: _lastNameController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'last name',
                        hintText: 'last name'),
                    keyboardType: TextInputType.name)),
            Padding(
                padding: EdgeInsets.all(10),
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
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: _passwordController,
                    autocorrect: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                        hintText: 'password'))),
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
                  'Register',
                ),
              ),
            ),
          ],
        )));
  }
}

/* class RegisterAuth {
  static Future<User?> registerInformation({
      required String username;
      required String email;
      required String password;
    }
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
  }

  try {
    UserCredential userCredential = await auth.createUser(
      email: email,
      password: password,
    );
  }

  user = UserCredential.user;

} */