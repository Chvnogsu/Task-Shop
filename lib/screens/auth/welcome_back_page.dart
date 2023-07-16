import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../intro_page.dart';
import 'register_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isEmailSelected = false;

  Future<void> signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        // User login successful, navigate to the next screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => IntroPage(),
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Login failed. Please check your credentials.'),
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

  void navigateToRegisterPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => RegisterPage()));
  }

  void showResetPasswordDialog() {
    String email = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Forgot Password'),
          content: TextField(
            onChanged: (value) {
              email = value;
            },
            decoration: InputDecoration(hintText: 'Enter your email'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                resetPassword(email);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Password Reset'),
            content: Text('A password reset link has been sent to your email.'),
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
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to send password reset email. Please try again.'),
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
    Widget welcomeBack = Text(
      'Welcome,',
      style: TextStyle(
        color: Colors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        shadows: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 5),
            blurRadius: 10.0,
          ),
        ],
      ),
    );

    Widget subTitle = Padding(
      padding: const EdgeInsets.only(right: 56.0),
      child: Text(
        'Login to your account using\nEmail and Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          signInWithEmailAndPassword();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[500]!, // Change the gradient color here
                Colors.grey[500]!, // Change the gradient color here
                Colors.grey[700]!, // Change the gradient color here
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
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

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 120,
      child: InkWell(
        onTap: navigateToRegisterPage,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[500]!, // Change the gradient color here
                Colors.grey[500]!, // Change the gradient color here
                Colors.grey[700]!, // Change the gradient color here
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
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

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
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
              ],
            ),
          ),
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: navigateToRegisterPage,
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Text(
            ' | ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: showResetPasswordDialog,
            child: Text(
              'Forgot your password?',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
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
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  welcomeBack,
                  SizedBox(height: 20.0),
                  subTitle,
                  SizedBox(height: 40.0),
                  loginForm,
                  SizedBox(height: 40.0),
                  registerButton,
                  SizedBox(height: 20.0),
                  loginButton,
                  SizedBox(height: 20.0),
                  forgotPassword,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
