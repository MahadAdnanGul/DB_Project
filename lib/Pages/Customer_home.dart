import 'package:flutter/material.dart';
import 'package:frontend/Pages/InventoryManagementPage.dart';
import 'package:frontend/Pages/User_profile.dart';
import 'package:frontend/Pages/ViewMenu.dart';
import 'package:frontend/Pages/homepage.dart';
import 'package:frontend/Pages/login.dart';
import 'package:frontend/Pages/menuMangementPage.dart';
import 'package:frontend/Pages/menuMangementPage_ViewUpdate.dart';
import 'package:frontend/Pages/newuser.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/models/http.dart';
import 'package:frontend/BO/BO.dart';
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:encrypt/encrypt.dart';

class CustomerPage extends StatefulWidget {
  int final_index;
  CustomerPage({this.final_index});
  _CustomerPageState createState() => _CustomerPageState();

}

class _CustomerPageState extends State<CustomerPage> {
  List<Customer> users = [];
  Http http = new Http();
  //int index;
  Color leadingBackgroundColor;
  Color leadingNumberColor;

  @override
  initState() {
    super.initState();
  }










  /*Widget _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          users.sort((a, b) => a.id.compareTo(b.id));
          return ExpansionTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: leadingBackgroundColor,
              child: Text('${users[index].id}',style: TextStyle(fontSize: 20.0, color: leadingNumberColor),),
            ),
            onExpansionChanged: (boo) => onExpansionChanged(boo),
            title: Text('${users[index].name}'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    raisedButton('Update',
                        onPressed: () => updateonPressed(index),
                        fontSize: 15.0),
                    raisedButton('Delete',
                        onPressed: () => deleteonPressed(context, index),
                        fontSize: 15.0),
                  ],
                ),
              ),
            ],
          );
        });
  }*/

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      setState(() {
        users = Provider.of<List<Customer>>(context);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('McCustomer', style: TextStyle(color: Colors.yellowAccent),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: raisedButton("Account",onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(final_index: widget.final_index,))))
          ),
          Container(
              child: raisedButton("Menu",
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewMenuItemPage()))
              )

          ),

          //  Container(
          //     child: raisedButton("View and update Menu",
          //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => ViewUpdateMenuItemPage()))
          //     )

          // ),
        ],
      ),
      // body: Center(
      // child: Padding(
      //  padding: const EdgeInsets.all(8.0), child: _buildList(context))),

    );
  }
}