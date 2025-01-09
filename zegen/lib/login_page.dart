import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for email and password input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Instance of FirebaseAuth for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // String to store error messages during login attempts
  String _error = '';

  // Boolean to toggle password visibility
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // Scaffold widget for the overall page structure
    return Scaffold(
      // App bar with title and consistent EVA-01-themed background
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Color(0xFF00FF00))),
        backgroundColor: Color(0xFF4B0082), // Dark purple
      ),
      // Body of the page containing input fields, buttons, and error messages
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Email input field with an email icon and consistent styling
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xFF00FF00)), // Green
                border: OutlineInputBorder(), // Added border for consistency
                prefixIcon:
                    Icon(Icons.email, color: Color(0xFF00FF00)), // Green
              ),
            ),
            SizedBox(height: 10), // Added for better spacing
            // Password input field with a lock icon and consistent styling
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFF00FF00)), // Green
                border: OutlineInputBorder(), // Added border for consistency
                prefixIcon: Icon(Icons.lock, color: Color(0xFF00FF00)), // Green
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFF00FF00),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            SizedBox(height: 20), // Added for better spacing
            // Elevated button for login with consistent EVA-01 styling
            ElevatedButton(
              onPressed: () async {
                // Attempt to sign in with email and password
                User? user = await signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                if (user != null) {
                  // Navigate to the HomePage on successful login
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  // Display an error message if login fails
                  setState(() {
                    _error = 'Login failed. Please check your credentials.';
                  });
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00FF00), // Green
                onPrimary: Colors.black, // Black text color
              ),
            ),
            // Text button to navigate to the SignUpPage
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Sign Up'),
              style: TextButton.styleFrom(
                primary: Color(0xFF00FF00), // Green text color
              ),
            ),
            // Display error message if it is not empty
            if (_error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _error,
                  style: TextStyle(
                      color: Colors.red, fontSize: 14), // Error message style
                ),
              ),
          ],
        ),
      ),
      // Dark purple background for a fresh look
      backgroundColor: Color(0xFF4B0082),
    );
  }

  // Function to sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Attempt to sign in with Firebase Auth
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      // Print error and return null if login fails
      print(e);
      return null;
    }
  }
}
