import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lf_test/modal/userdetails.dart';
import 'package:lf_test/modal/lost_found.dart';
import 'package:lf_test/services/storage.dart';

class DataBase{
  final CollectionReference collection = FirebaseFirestore.instance.collection("users");
  final CollectionReference lfCollection = FirebaseFirestore.instance.collection("lost&found");
  final uid;
  final appStorage = AppStorage();
  static dynamic previousSnap;
  DataBase({this.uid});

//  update to the database
  Future updateDatabase({required String name, required String phone, required String password}) async{
    return await collection.doc(uid).set({
      'name': name,
      'phone': phone,
      'password': password
    });
  }

//  update image of the user
  Future updateImg(File image) async{
    var imageUrl = await appStorage.uploadImg(image, uid.toString());
    await collection.doc(uid).update({'image': imageUrl});
  }

  Future uploadImage(File image, String name) async{
    var imageUrl = await appStorage.uploadImg(image, name);
    return imageUrl;
  }

// Lost and Found Database HERE

// get lost and found of all users
  List<LostFound> getLostFound(QuerySnapshot snapshot) {
    List<LostFound> sample = [];
    snapshot.docs.map((doc) {
      dynamic data = doc.data();
      dynamic uid = doc.id;
      data['lost'].map((item){
        sample.add(LostFound(
          itemName: item['name'],
          description: item['description'],
          uid: uid,
          type: 'lost',
          imageUrl: item['image'],
          phone: item['phone']
        ));
      });
    });
    return sample;
  }

//  get lost and found of a single user

//  Stream of data
  Stream<List<LostFound>> get lostFound{
    // Show only new documents
    if(previousSnap != null){
      return lfCollection.limit(10).startAfterDocument(previousSnap).snapshots().map(getLostFound);
    }
    // if its first time then only limit
    else {
      return lfCollection.limit(100).snapshots().map(getLostFound);
    }
  }

// update to the lost&found
  Future updateLostFound({String? description, String? imageUrl, required String type, String? category, String? location, String? date, String? phone}) async{
    return await lfCollection.doc(uid).set({
      type: FieldValue.arrayUnion([{
        'category': category,
        'location': location,
        'date': date,
        'description': description,
        'phone': phone,
        'image': imageUrl
      }])
    });
  }

//  remove from the lost&found
  Future removeLostFound({String? description, String? imageUrl, required String type, String? name}) async{
    return await lfCollection.doc(uid).update({
      type: FieldValue.arrayRemove([{
        'name': name,
        'description': description,
        'image': imageUrl
      }])
    });
  }
}
