import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/main.dart';

class fetch extends StatefulWidget {
  const fetch({super.key});

  @override
  State<fetch> createState() => fetchState();
}

class fetchState extends State<fetch> {
  String data = '';

  void initstate() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var token = await getToken();
    final response = await http.post(
      Uri.parse(
          'https://server-gules-alpha.vercel.app/shopkeeper/list'), // Replace with your API endpoint
      headers: {
        "Authorization":
            "Bearer $token", // Send the user's authentication token
      },
    );

    if (response.statusCode == 200) {
      print('Response:${response.body}');
      setState(() {
        data = response.body;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: fetchData, child: Center(child: Text(data))),
        ],
      ),
    );
  }
}
