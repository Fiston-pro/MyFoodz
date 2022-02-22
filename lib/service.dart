import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfoodz/modal.dart';

class DatabaseService {
  
  //initialise firestore
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User>? get_data (String id) async{
    var snap = await _db.collection("users").doc(id).get();
    return User.fromMap(snap.data());
  }

}