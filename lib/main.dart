import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var token = await getToken();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Test Project',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: token != null ? pro() : chris(),
  ));
}

Future getToken() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('token') ?? null;
}
