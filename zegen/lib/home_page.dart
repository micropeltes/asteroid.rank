import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'note_detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userId;
  List<dynamic> data = [];
  bool isLoading = true;
  String errorMessage = '';
  int? selectedIndex;
  int? hoveredIndex;

  @override
  void initState() {
    super.initState();
    fetchData().catchError((error) {
      // Handle error
      print('Error fetching data: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error fetching data: $error'),
            actions: <Widget>[
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
      setState(() {
        errorMessage = 'Error fetching data: $error';
        isLoading = false;
      });
    });
  }

  Future<void> fetchData() async {
    try {
      // Step 1: Identify the query
      final queryResponse = await http.get(
          Uri.parse('https://data.minorplanetcenter.net/api/query-identifier'));
      if (queryResponse.statusCode == 200) {
        final queryIdentifier = json.decode(queryResponse.body)['identifier'];

        // Step 2: Send the request to asterank API
        final response = await http.get(Uri.parse(
            'https://www.asterank.com/api/mpc?query=$queryIdentifier'));
        if (response.statusCode == 200) {
          setState(() {
            data = json.decode(response.body);
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = 'Error fetching data: ${response.statusCode}';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = 'Error identifying query: ${queryResponse.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching data: $e';
        isLoading = false;
      });
    }
  }

  String? getCurrentUserId() {
    final User? user = _auth.currentUser;
    return user?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF4B0082), // Eva-01 purple
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color(0xFF00FF00)), // Eva-01 green
        backgroundColor: Color(0xFF000000), // Eva-01 black
        fontFamily: 'Helvetica',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF00FF00)), // Eva-01 green
          bodyText2: TextStyle(color: Color(0xFF00FF00)), // Eva-01 green
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page',
              style: TextStyle(color: Color(0xFF00FF00))), // Eva-01 green
          backgroundColor: Color(0xFF4B0082), // Eva-01 purple
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredIndex = index;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredIndex = null;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => NoteDetailPage(
                                  M: double.tryParse(
                                          data[index]['M'].toString()) ??
                                      0.0,
                                  G: double.tryParse(
                                          data[index]['G']?.toString() ??
                                              data[index]['readable_des']
                                                  .toString()) ??
                                      0.0,
                                  rms: double.tryParse(
                                          data[index]['rms'].toString()) ??
                                      0.0,
                                  pertP: double.tryParse(
                                          data[index]['pert_p'].toString()) ??
                                      0.0,
                                  epoch: double.tryParse(
                                          data[index]['epoch'].toString()) ??
                                      0.0,
                                  H: double.tryParse(
                                          data[index]['H'].toString()) ??
                                      0.0,
                                  numObs: double.tryParse(
                                          data[index]['num_obs'].toString()) ??
                                      0.0,
                                  ref: double.tryParse(
                                          data[index]['ref'].toString()) ??
                                      0.0,
                                  lastObs: double.tryParse(
                                          data[index]['last_obs'].toString()) ??
                                      0.0,
                                  comp: double.tryParse(
                                          data[index]['comp'].toString()) ??
                                      0.0,
                                  U: double.tryParse(
                                          data[index]['U'].toString()) ??
                                      0.0,
                                  e: double.tryParse(
                                          data[index]['e'].toString()) ??
                                      0.0,
                                  a: double.tryParse(
                                          data[index]['a'].toString()) ??
                                      0.0,
                                  om: double.tryParse(
                                          data[index]['om'].toString()) ??
                                      0.0,
                                  d: double.tryParse(
                                          data[index]['d'].toString()) ??
                                      0.0,
                                  i: double.tryParse(
                                          data[index]['i'].toString()) ??
                                      0.0,
                                  des: double.tryParse(
                                          data[index]['des'].toString()) ??
                                      0.0,
                                  flags: double.tryParse(
                                          data[index]['flags'].toString()) ??
                                      0.0,
                                  numOpp: double.tryParse(
                                          data[index]['num_opp'].toString()) ??
                                      0.0,
                                  w: double.tryParse(
                                          data[index]['w'].toString()) ??
                                      0.0,
                                  pertC: double.tryParse(
                                          data[index]['pert_c'].toString()) ??
                                      0.0,
                                  readableDes: double.tryParse(data[index]
                                              ['readable_des']
                                          .toString()) ??
                                      0.0,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(data[index]['readable_des'].toString()),
                            tileColor: hoveredIndex == index
                                ? Color(0xFF00FF00) // Eva-01 green
                                : Color(0xFF4B0082), // Eva-01 purple
                            textColor: hoveredIndex == index
                                ? Color(0xFF4B0082) // Eva-01 purple
                                : Color(0xFF00FF00), // Eva-01 green
                          ),
                        ),
                      );
                    },
                  ),
        backgroundColor: Color(0xFF000000), // Eva-01 black
      ),
    );
  }
}
