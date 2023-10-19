import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/login.dart';
import 'package:project/show.dart';

void navigateNextPage(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return const chris();
  }));
}

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => NewState();
}

class NewState extends State<New> {
  /*TextEditingController _date = TextEditingController();*/
  final _formkey = GlobalKey<FormState>();
  final password = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final name = TextEditingController();
  final address = TextEditingController();
  final brandname = TextEditingController();

  Future postDataToServer() async {
    Uri apiUrl =
        Uri.parse('https://server-gules-alpha.vercel.app/shopkeeper/register');
    final data = {
      'email': email.text,
      'password': password.text,
      'mobile': mobile.text,
      'ownername': name.text,
      'shopname': brandname.text,
      'address': address.text,
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
      print('data sent successfully');
      print('Response:${response.body}');
    } else {
      print('Error sending data.status code: ${response.statusCode}');
      print('Response:${response.body}');
    }
  }

  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 420,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  "REGISTRATION PAGE",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: name,
                  maxLength: 25,
                  decoration: InputDecoration(
                    labelText: ("NAME"),
                    hintText: "ENTER YOUR NAME",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                ),
                /*TextFormField(
                  controller: _date,
                  maxLength: 25,
                  decoration: InputDecoration(
                    labelText: ("DATE OF BIRTH"),
                    hintText: "ENTER DATE OF BIRTH",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month_outlined),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025));

                          if (pickedDate != null) {
                            print(pickedDate);
                            setState(() {
                              _date.text =
                                  pickedDate.toString().substring(0, 10);
                            });
                          }
                        }),
                  ),
                ),*/
                TextFormField(
                  maxLength: 25,
                  controller: brandname,
                  decoration: InputDecoration(
                    labelText: ("BRAND NAME"),
                    hintText: "ENTER BRAND NAME",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter The Shop Name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 120,
                  controller: address,
                  decoration: InputDecoration(
                    labelText: ("ADDRESS"),
                    hintText: "ENTER YOUR ADDRESS",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Address";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 25,
                  controller: password,
                  obscureText: passwordObscured,
                  decoration: InputDecoration(
                    labelText: ("PASSWORD"),
                    hintText: "ENTER YOUR PASSWORD",
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
                        )),
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (password.text.length < 6) {
                      return "Password Length Should Be More Than 6 Characters";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 15,
                  controller: mobile,
                  decoration: InputDecoration(
                    labelText: ("MOBILE NUMBER"),
                    hintText: "ENTER YOUR MOBILE NUMBER",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                TextFormField(
                  maxLength: 25,
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "EMAIL ID",
                    hintText: "ENTER YOUR EMAIL ID",
                    hintStyle: TextStyle(color: Colors.purple),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    bool emailvalid = RegExp(
                            r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);

                    if (value.isEmpty) {
                      return "Enter EMAIL";
                    } else if (!emailvalid) {
                      return "Enter valid EMAIL ID";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => extra(
                                      name: name.text,
                                      email: email.text,
                                      mobile: mobile.text,
                                      password: password.text,
                                      address: address.text,
                                      brandname: brandname.text,
                                    )),
                          );
                        }
                        postDataToServer();
                      },
                      child: const Text("REGISTER"),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {
                        navigateNextPage(context);
                        print("Exited Successfully");
                      },
                      child: Text("BACK TO LOGIN"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
