import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lf_test/modal/lost_found.dart';
import 'package:lf_test/modal/member.dart';
import 'package:lf_test/profile/profile.dart';
import 'package:lf_test/profile/user.dart';
import 'package:lf_test/screens/home/fform.dart';
import 'package:lf_test/screens/home/lform.dart';
import 'package:lf_test/services/auth.dart';
import 'package:lf_test/services/database.dart';
import 'package:lf_test/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController scrollController = ScrollController();
  ImagePicker _picker=new ImagePicker();
  dynamic authuser;
  User user=User();
  @override
  void initState() {
    // scroll controller event
    // scrollController.addListener(scrollListener);
    super.initState();
  }
  void scrollListener(){
    if(scrollController.offset > scrollController.position.maxScrollExtent/2){
    }
  }
  @override
  Widget build(BuildContext context) {
    user.name='';
    user.dob='';
    user.address='';
    user.email='';
    user.phone='';
    final lfDB = Provider.of<List<LostFound>>(context);
    authuser= Provider.of<Member?>(context);
    final auth = Auth();
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar:AppBar(
        backgroundColor: Colors.cyan[900],
        title:Text('LOST AND FOUND'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(flex:1,child: Container()),
                Expanded(flex:12,
                  child: Container(width: 550,height: 220,decoration: BoxDecoration(color: Colors.cyan[900],border: Border.all(color: Colors.black)),

                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('ADD DETAIL ABOUT LOST ITEM',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w800)),
                        Container(height: 40,width: 150,decoration: BoxDecoration(color: Colors.cyan[700],borderRadius: BorderRadius.circular(25)),
                            child: TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LForm()));}, child: Text('ADD POST',style: TextStyle(fontSize: 20,color: Colors.white),))),
                      ],
                    ),
                  ),
                ),
                Expanded(flex:1,
                    child:

                    Container()),
              ],
            ),
            Row(
              children: [
                Expanded(flex:1,child: Container()),
                Expanded(flex:12,
                  child: Container(
                    width: 550,
                    height: 220,
                    decoration: BoxDecoration(color: Colors.cyan[900],border: Border.all(color: Colors.black)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('ADD DETAIL ABOUT FOUND ITEM',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w800),),
                        Container(height: 40,width: 150,decoration: BoxDecoration(color: Colors.cyan[700],borderRadius: BorderRadius.circular(25)),
                            child: TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>FForm()));}, child: Text('ADD POST',style: TextStyle(fontSize: 20,color: Colors.white),))),
                      ],
                    ),
                  ),
                ),
                Expanded(flex:1,child: Container()),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[900],
              ),
              child: Text('LOST AND FOUND',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25,),),

            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.person_sharp),
                  const Text('profile',style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(user)));},
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(Icons.logout_outlined),
                  const Text('logout',style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              onTap: () async {
                await auth.signOut();
                },
            ),
          ],
        ),
      ),
    );
    // return SingleChildScrollView(
    //   child: Container(
    //     child: Column(
    //       children: [
    //         // GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: MediaQuery.of(context).size.width),
    //         // scrollDirection: Axis.horizontal,
    //         // ),
    //         Row(),
    //         // get users data from firestore and infinite scroll
    //         ListView(
    //           controller: scrollController,
    //           shrinkWrap: true,
    //           children: [
    //             ...lfDB.map((data){
    //               return ListTile(
    //                 title: Text("hello"),
    //               );
    //             }).toList()
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
  getImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    File file = File(photo!.path);
    String store = "Storage.jpg";
    await new DataBase(uid: authuser.uid).updateImg(file);
  }
}

