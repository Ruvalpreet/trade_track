import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    index == 0
                        ? 'Inventory'
                        : index == 1
                            ? 'Check Out'
                            : index == 2
                                ? 'Check In'
                                : 'Orders',
                  ),
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
        children: const [
          ListTile(
            title: Text('Inventory'),
          ),
          ListTile(
            title: Text('Check Out'),
          ),
          ListTile(
            title: Text('Check In'),
          ),
          ListTile(
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
