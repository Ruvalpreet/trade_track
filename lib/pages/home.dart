import 'package:flutter/material.dart';
import 'package:trade_track/pages/Inventory.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Method to generate the list of Inventory objects
  List<Inventory> _generateInventoryList() {
    final List<Map<String, dynamic>> dataSet = [
      {
        'itemName': 'Item 1',
        'itemDescription': 'Description 1',
        // 'itemQuantity': 5,
        // 'itemStatus': true,
        // 'itemID': 1,
        // 'itemSize': 'Small',
        // 'type': 'Type A',
        // 'checkInDate': DateTime.now(),
        // 'checkOutDate': DateTime.now(),
        // 'location': 'Location A',
      },
      {
        'itemName': 'Item 2',
        'itemDescription': 'Description 2',
        // 'itemQuantity': 10,
        // 'itemStatus': false,
        // 'itemID': 2,
        // 'itemSize': 'Large',
        // 'type': 'Type B',
        // 'checkInDate': DateTime.now(),
        // 'checkOutDate': DateTime.now(),
        // 'location': 'Location B',
      },
    ];
    return dataSet.map((data) {
      return Inventory(
        itemName: data['itemName'],
        itemDescription: data['itemDescription'],
        // itemQuantity: data['itemQuantity'],
        // itemStatus: data['itemStatus'],
        // itemID: data['itemID'],
        // itemSize: data['itemSize'],
        // type: data['type'],
        // checkInDate: data['checkInDate'],
        // checkOutDate: data['checkOutDate'],
        // location: data['location'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: const Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'GUGU GAGA',
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _generateInventoryList().length,
              itemBuilder: (context, index) {
                final inventory = _generateInventoryList()[index];
                return ListTile(
                  title: Text(inventory.itemName),
                  subtitle: Text(inventory.itemDescription),
                  // trailing: Text(inventory.itemQuantity.toString()),
                  leading: const Icon(Icons.inventory),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Text('Inventory'),
          ),
          const ListTile(
            title: Text('Check Out'),
          ),
          ListTile(
            title: const Text('Check In'),
            onTap: () => Navigator.pushNamed(context, '/check-in'),
          ),
          const ListTile(
            title: Text('Orders'),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Trade Track',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 4.0,
      shadowColor: Colors.black,
    );
  }
}
