import 'package:flutter/material.dart';
import 'package:trade_track/pages/Inventory.dart';
import 'package:trade_track/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory List'),
      ),
      body: FutureBuilder(
        future: Api.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Inventory>? pdata = snapshot.data as List<Inventory>?;

            return ListView.builder(
              itemCount: pdata!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.inventory),
                  trailing: const Icon(Icons.chevron_right),
                  title: Text("${pdata[index].itemName}"),
                  subtitle: Text("${pdata[index].itemDescription}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InventoryDetailsPage(
                          inventory: pdata[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class InventoryDetailsPage extends StatelessWidget {
  final Inventory inventory;

  const InventoryDetailsPage({Key? key, required this.inventory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Name: ${inventory.itemName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Item Description: ${inventory.itemDescription}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Item Quantity: ${inventory.itemQuantity}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Item Status: ${inventory.itemStatus}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Item Size: ${inventory.itemSize}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Type: ${inventory.type}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Check In Date: ${inventory.checkInDate}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Location: ${inventory.location}',
              style: TextStyle(fontSize: 16),
            )
            // Add other details as needed
          ],
        ),
      ),
    );
  }
}
