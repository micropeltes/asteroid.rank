import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _error = '';
  bool _isLoading = false;

  Future<void> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
    } catch (e) {
      String message;
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          message = 'The email address is already in use by another account.';
        } else {
          message = 'Failed to create an account. Please try again.';
        }
      } else {
        message = 'An unknown error occurred.';
      }
      setState(() {
        _error = message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(color: Color(0xFF00FF00))),
        backgroundColor: Color(0xFF4B0082), // Dark purple
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xFF00FF00)), // Green
                border: OutlineInputBorder(),
                prefixIcon:
                    Icon(Icons.email, color: Color(0xFF00FF00)), // Green
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFF00FF00)), // Green
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Color(0xFF00FF00)), // Green
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.secondary),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      await signUpWithEmailAndPassword(context,
                          _emailController.text, _passwordController.text);
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00FF00), // Green
                      onPrimary: Color(0xFF4B0082), // Dark purple
                    ),
                  ),
            SizedBox(height: 10),
            Text(
              _error,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF4B0082), // Dark purple
    );
  }
}
