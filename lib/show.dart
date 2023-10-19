// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:project/register.dart';

void navigateNextPage(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return const New();
  }));
}

class extra extends StatelessWidget {
  String name, email, mobile, password, brandname, address;

  extra({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.brandname,
    required this.address,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 570,
          width: 570,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10),
              Center(
                child: Text("REGISTERED DATA",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    )),
              ),
              SizedBox(height: 40),
              DataTable(columns: [
                DataColumn(
                    label: Text('TITLE',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ))),
                DataColumn(
                    label: Text('DATA',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ))),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('NAME',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
                DataRow(cells: [
                  DataCell(Text('PASSWORD',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${password}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
                DataRow(cells: [
                  DataCell(Text('MOBILE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${mobile}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
                DataRow(cells: [
                  DataCell(Text('EMAIL ID',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${email}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
                DataRow(cells: [
                  DataCell(Text('BRANDNAME',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${brandname}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
                DataRow(cells: [
                  DataCell(Text('ADDRESS',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ))),
                  DataCell(Text('${address}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))),
                ]),
              ]),
              SizedBox(height: 33),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      navigateNextPage(context);
                      print("Exited Successfully");
                    },
                    child: Text("GO BACK"),
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
