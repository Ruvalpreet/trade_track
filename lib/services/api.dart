import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trade_track/pages/Inventory.dart';

class Api {
  static const String baseUrl = "http://10.186.143.113:2000/api/";

  static addProduct(Map product) async {
    print(product);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: product);
      if (res.statusCode == 200) {
        print("successfull added the object");
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
        print("successfull display the object");
        var data = jsonDecode(res.body);
        data['inventory'].forEach((value) {
          print(value);
          inventoryList.add(Inventory(
              itemName: value['itemName'] ?? "No name",
              itemDescription: value['itemDescription'] ?? "No description",
              itemQuantity: value['itemQuantity'] ?? "No quantity",
              itemStatus: value['itemStatus'] ?? "No status",
              itemID: value['itemID'] ?? "No ID",
              itemSize: value['itemSize'] ?? "No size",
              checkInDate: value['checkInDate'] ?? "No date",
              location: value['location'] ?? "No location",
              type: value['type'] ?? "No type"));
        });

        print(inventoryList);
        print("this is inventory list");
        return inventoryList;
      } else {
        return [];
        // print("failed to get response");
        // print(res.statusCode);
        // print(url);
      }
    } catch (e) {
      print("Error in getProducts: " + e.toString());
    }
  }
}
