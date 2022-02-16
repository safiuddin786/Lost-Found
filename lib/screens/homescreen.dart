import 'package:flutter/material.dart';
import 'package:lf_test/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          TextButton.icon(onPressed: () async{
            await auth.signOut();
          }, icon: Icon(
            Icons.logout,
            color: Colors.red,
          ), label: Text("Logout"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(),

            ],
          ),
        ),
      )
    );
  }
}
