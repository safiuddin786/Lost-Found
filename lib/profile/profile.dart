import 'package:flutter/material.dart';
import 'package:lf_test/profile/Editable.dart';
import 'package:lf_test/profile/user.dart';

class Profile extends StatelessWidget {
  final User user;
  Profile(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Center(child: Text('Profile')),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage:AssetImage('images/pic1.jpeg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(user.name!,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,8),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(color: Colors.grey[850],borderRadius: BorderRadius.circular(25.0)),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Personal Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone : '+user.phone!,style: const TextStyle(color: Colors.white,height: 3,fontWeight: FontWeight.bold),),
                            Text('D.O.B : '+user.dob!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text('E-mail : '+user.email!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text('Address : '+user.address!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Editable(user)),
              );
            },
                child: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(onPressed: () {
// Navigator.pop(context);
// },
// child: Icon(Icons.edit),
// ),