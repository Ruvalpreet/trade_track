import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trade_track/pages/Inventory.dart';

class Api {
  static const String baseUrl = "http://192.168.0.17/api/";

  static addProduct(Map product) async {
    print(product);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: product);
      if (res.statusCode == 200) {
        print("success");
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("failed to get response");
        print(res.statusCode);
        print(url);
      }
    } catch (e) {
      print("Error in addProduct: " + e.toString());
    }
  }

  static getProducts() async {
    List<Inventory> inventoryList = [];
    var url = Uri.parse("${baseUrl}get_products");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        print("success");
        var data = jsonDecode(res.body);
        data['inventory'].forEach((value) {
          inventoryList.add(Inventory(
              itemName: value['name'], itemDescription: value['description']));
        });
        return inventoryList;
      } else {
        print("failed to get response");
        print(res.statusCode);
        print(url);
      }
    } catch (e) {
      print("Error in getProducts: " + e.toString());
    }
  }
}
