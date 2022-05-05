import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lf_test/modal/lost_found.dart';
import 'package:lf_test/modal/member.dart';
import 'package:lf_test/services/database.dart';
import 'package:lf_test/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController scrollController = ScrollController();
  ImagePicker _picker=new ImagePicker();
  dynamic authuser;
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
    final lfDB = Provider.of<List<LostFound>>(context);
    // authuser= Provider.of<Member?>(context);
    return Container(
      child: IconButton(icon: Icon(Icons.camera_alt), onPressed: getImage),
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

