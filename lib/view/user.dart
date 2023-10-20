import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/view/fetch.dart';
import 'package:project/view/home.dart';
import 'package:project/main.dart';
import 'package:project/view/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: chat(),
    );
  }
}

class chat extends StatefulWidget {
  @override
  State<chat> createState() => chatState();
}

class chatState extends State<chat> {
  TextEditingController shopnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> updateData() async {
    var token = await getToken();
    final response = await http.post(
      Uri.parse(
          'https://server-gules-alpha.vercel.app/shopkeeper/update'), // Replace with your API endpoint
      headers: {
        "Authorization":
            "Bearer $token", // Send the user's authentication token
      },
      body: {
        'shopname': shopnameController.text,
        'address': addressController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("UPDATED SUCCESSFULLY"),
        behavior: SnackBarBehavior.floating,
        width: 500,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ));
      print('Updated Successfully');
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteData() async {
    var token = await getToken();
    final response = await http.post(
      Uri.parse(
          'https://server-gules-alpha.vercel.app/shopkeeper/del'), // Replace with your API endpoint
      headers: {
        "Authorization":
            "Bearer $token", // Send the user's authentication token
      },
    );
    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => chris()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("DELETED SUCCESSFULLY"),
        behavior: SnackBarBehavior.floating,
        width: 500,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ));
      print('Account Deleted Successfully');
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      throw Exception('Failed to Delete data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 600,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                "USER ACCOUNT SETTINGS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: shopnameController,
                decoration: InputDecoration(
                  labelText: "Enter Brand Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Enter Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: updateData,
                    child: Text("UPDATE ACCOUNT"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => fetch()),
                      );
                    },
                    child: Text("FETCH DETAILS"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  deleteData();
                                },
                                child: const Text("YES")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("NO")),
                          ],
                          title: const Text(
                            "ARE YOU SURE TO DELETE ACCOUNT?",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text("DELETE ACCOUNT"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => pro()),
                      );
                    },
                    child: Text("BACK TO HOME"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
