import 'package:flutter/material.dart';
import 'package:trade_track/services/api.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({super.key});

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  var itemName = TextEditingController();
  var itemDescription = TextEditingController();
  var itemQuantity = TextEditingController();
  var itemStatus = TextEditingController();
  var itemID = TextEditingController();
  var itemSize = TextEditingController();
  var type = TextEditingController();
  var checkInDate = TextEditingController();
  var checkOutDate = TextEditingController();
  var location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: itemName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Item Name',
          ),
        ),
        TextField(
          controller: itemDescription,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Item Description',
          ),
        ),
        // TextField(
        //   controller: itemQuantity,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Item Quantity',
        //   ),
        // ),
        // TextField(
        //   controller: itemStatus,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Item Status',
        //   ),
        // ),
        // TextField(
        //   controller: itemID,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Item ID',
        //   ),
        // ),
        // TextField(
        //   controller: itemSize,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Item Size',
        //   ),
        // ),
        // TextField(
        //   controller: type,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Type',
        //   ),
        // ),
        // TextField(
        //   controller: checkInDate,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Check In Date',
        //   ),
        // ),
        // TextField(
        //   controller: location,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Location',
        //   ),
        // ),
        ElevatedButton(
            onPressed: () {
              var data = {
                'name': itemName.text,
                'description': itemDescription.text,
                // 'quantity': itemQuantity.text,
                // 'status': itemStatus.text,
                // 'id': itemID.text,
                // 'size': itemSize.text,
                // 'type': type.text,
                // 'checkInDate': checkInDate.text,
                // 'location': location.text
              };
              Api.addProduct(data);
            },
            child: const Text('Submit')),
      ]),
    );
  }
}
