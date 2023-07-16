import 'package:task_shop/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forgot_password_page.dart';
import 'package:task_shop/screens/intro_page.dart'; // Import intro_page.dart

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cmfPassword = TextEditingController();

  bool isEmailSelected = false;

  Future<void> registerWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        // User registration successful, navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroPage()),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Registration failed. Please try again.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Glad To Meet You',
      style: TextStyle(
        color: Colors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        shadows: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 5),
            blurRadius: 10.0,
          )
        ],
      ),
    );

    Widget subTitle = Padding(
      padding: const EdgeInsets.only(right: 56.0),
      child: Text(
        'Create your new account for future uses.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          registerWithEmailAndPassword();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
            child: Text(
              'Register',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[500], // Set the background color to grey
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
    );

    Widget registerForm = Container(
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                    onTap: () {
                      setState(() {
                        isEmailSelected = true;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: isEmailSelected ? '' : 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: password,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: cmfPassword,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
          registerButton,
        ],
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
            fontSize: 12.0,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                title,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                registerForm,
                Spacer(flex: 2),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: socialRegister,
                ),
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
