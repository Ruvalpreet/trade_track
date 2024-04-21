import 'package:flutter/material.dart';
import 'package:trade_track/pages/Inventory.dart';
import 'package:trade_track/pages/fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Method to generate the list of Inventory objects

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
          ListTile(
            title: const Text('view orders'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FetchData(),
                )),
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
