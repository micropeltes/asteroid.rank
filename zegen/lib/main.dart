import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:zegen/splash_page.dart';
import 'dart:convert';

void main() {
  // Ensure that Flutter is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAjlYsPzuhbIBsQKzGBbh1XeGWMGi47-JE',
      appId: '1:261506742975:web:55f74d2c18c139420c240a',
      messagingSenderId: '261506742975',
      projectId: 'zegen-85d77',
      authDomain: 'zegen-85d77.firebaseapp.com',
      storageBucket: 'zegen-85d77.firebasestorage.app',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData eva01Theme = ThemeData(
      primaryColor: Color(0xFF4B0082), // Eva-01 purple
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xFF00FF00), // Eva-01 green
      ),
      scaffoldBackgroundColor: Color(0xFF4B0082), // Purple background
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xFFFFFFFF)), // White text
        bodyText2: TextStyle(color: Color(0xFFFFFFFF)), // White text
      ),
    );

    return MaterialApp(
      theme: eva01Theme,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Once complete, show the SplashScreen
          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          // Otherwise, show the splash screen while waiting for initialization to complete
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

// Define URL
const String url = 'https://asterank.com/api/mpc';

// Create an HTTP client
final http.Client httpClient = http.Client();

Future<List<dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'https://cors-anywhere.herokuapp.com/https://asterank.com/api/mpc'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle potential errors like network issues or timeouts
    print('Error fetching data: $e');
    throw Exception('Error fetching data: $e');
  }
}
