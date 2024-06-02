import 'package:ecommerce/screens/helpPoliciesPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/model/UserClass.dart';

class MenuDrawer extends StatelessWidget {
  var name = "Shejal";
  var usermail = "shejal@gmail.com";
  var phone = "8366483746";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 232, 223, 223),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 218, 202, 202),
              ),
              accountName: Text(
                '${name}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 23),
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/019/896/012/original/female-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.black),
              title: Text(
                '${usermail}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.black),
              title: Text(
                '${phone}',
                style: TextStyle(color: Colors.black),
              ),
            ),
           Container(
              padding: EdgeInsets.symmetric(vertical: 390.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpPoliciesPage()),
                      );
                    },
                   child: Text(
                    'Help & Policies',
                    style: TextStyle(color: Colors.black, fontSize: 16.0,  fontWeight: FontWeight.bold ), 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}