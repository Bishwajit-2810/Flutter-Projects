import 'package:flutter/material.dart';

var myBackground = Colors.grey[300];
var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
var myDrawer = const Drawer(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("H O M E"),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("M E S S A G E"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("S E T T I N G S"),
          ),
        ],
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("L O G O U T"),
      ),
    ],
  ),
);
