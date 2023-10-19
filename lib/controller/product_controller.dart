import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/model/shopkeeper.dart';
import 'package:project/main.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var shopkeeperDetails = <Shopkeeper>[].obs;
  Future<void> fetchData() async {
    var token = await getToken();
    final response = await http.post(
      Uri.parse('https://server-gules-alpha.vercel.app/shopkeeper/list'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      List js = json.decode(response.body);
      shopkeeperDetails.value = js.map((e) => Shopkeeper.fromJson(e)).toList();
      for (var s in shopkeeperDetails) {
        print('ID: ${s.id}');
        print('Shop Name: ${s.shopname}');
        print('Owner Name: ${s.ownername}');
        print('Email: ${s.email}');
        print('Password: ${s.password}');
        print('Mobile: ${s.mobile}');
        print('Address: ${s.address}');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
