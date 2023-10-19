import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/view/home.dart';
import 'package:project/view/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void navigateNextPage(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return const New();
  }));
}

class chris extends StatefulWidget {
  const chris({super.key});

  @override
  State<chris> createState() => chrisState();
}

class chrisState extends State<chris> {
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController(text: 'Vijay@gmail.com');
  final passwordcontroller = TextEditingController(text: '123456');

  Future postDataToServer() async {
    Uri apiUrl =
        Uri.parse('https://server-gules-alpha.vercel.app/shopkeeper/login');
    final data = {
      'email': emailcontroller.text,
      'password': passwordcontroller.text,
    };
    String? jsonData = json.encode(data);
    print(jsonData);

    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );
    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => pro()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("LOGGED IN SUCCESSFULLY"),
        behavior: SnackBarBehavior.floating,
        width: 500,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: () {},
        ),
      ));
      print('data sent successfully');
      // print('Response:${response.body}');
      var data = json.decode(response.body);
      print(data['token']);
      var token = data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("INVALID CREDENTIALS"),
        behavior: SnackBarBehavior.floating,
        width: 500,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: () {},
        ),
      ));
      print('Error sending data.status code: ${response.statusCode}');
      print('Response:${response.body}');
    }
  }

  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Center(
                child: Text(
                  "WELCOME",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Form(
              key: _formfield,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 55,
                        backgroundImage: AssetImage('assets/User.png')),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            hintText: "Enter EMAIL ID",
                          ),
                          validator: (value) {
                            bool emailvalid = RegExp(
                                    r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);

                            if (value.isEmpty) {
                              return "Enter EMAIL";
                            } else if (!emailvalid) {
                              return "Enter Valid EMAIL ID";
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: passwordObscured,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            hintText: "Enter Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordObscured = !passwordObscured;
                                  });
                                },
                                icon: Icon(
                                  passwordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (passwordcontroller.text.length < 6) {
                            return "Password Length Should Be More Than 6 Characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', true);
                        if (_formfield.currentState!.validate()) {}
                        postDataToServer();
                      },
                      child: const Text("LOGIN"),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      child: const Text("GO TO REGISTER"),
                      onPressed: () {
                        navigateNextPage(context);
                        print("Registered Successfully");
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filled(
                            icon: const Icon(Icons.facebook_outlined),
                            tooltip: 'LOGIN WITH FACEBOOK',
                            onPressed: () {}),
                        IconButton.filled(
                            icon: const Icon(Icons.g_mobiledata_outlined),
                            tooltip: 'LOGIN WITH GOOGLE',
                            onPressed: () {}),
                        IconButton.filled(
                            icon: const Icon(Icons.local_post_office_outlined),
                            tooltip: 'LOGIN WITH GMAIL',
                            onPressed: () {}),
                      ],
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
