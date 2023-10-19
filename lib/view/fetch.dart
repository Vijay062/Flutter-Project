import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/product_controller.dart';
import 'package:project/view/user.dart';

class fetch extends StatefulWidget {
  const fetch({super.key});

  @override
  State<fetch> createState() => fetchState();
}

class fetchState extends State<fetch> {
  final productcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Expanded(
                child: Center(
                  child: Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text(
                          "CURRENT DETAILS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                        SizedBox(height: 15),
                        ...productcontroller.shopkeeperDetails
                            .map(
                              (element) => ListTile(
                                title: Center(child: Text(element.ownername)),
                              ),
                            )
                            .toList(),
                        ...productcontroller.shopkeeperDetails
                            .map((Element) => ListTile(
                                  title: Center(child: Text(Element.email)),
                                ))
                            .toList(),
                        ...productcontroller.shopkeeperDetails
                            .map((Element) => ListTile(
                                  title: Center(child: Text(Element.password)),
                                ))
                            .toList(),
                        ...productcontroller.shopkeeperDetails
                            .map((Element) => ListTile(
                                  title: Center(child: Text(Element.mobile)),
                                ))
                            .toList(),
                        ...productcontroller.shopkeeperDetails
                            .map((Element) => ListTile(
                                  title: Center(child: Text(Element.shopname)),
                                ))
                            .toList(),
                        ...productcontroller.shopkeeperDetails
                            .map((Element) => ListTile(
                                  title: Center(child: Text(Element.address)),
                                ))
                            .toList(),
                        SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => chat()),
                              );
                            },
                            child: Text("GO BACK")),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
