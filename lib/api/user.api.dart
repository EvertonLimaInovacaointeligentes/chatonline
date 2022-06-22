import 'package:chatonline/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserApi{
  static Future createUser({required User usuario}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(
      id: docUser.id,
      name: usuario.name,
      age: usuario.age,
      birthday: usuario.birthday,
    );
    final json = user.toJson();
    await docUser.set(json);
  }
  static DateTime toDateTime(Timestamp value){
    if(value ==null) return DateTime.now();
    return value.toDate();
  }
  static Stream<List<User>> readUsers() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) =>
            snapshot.docs.map((doc) =>
                User.fromJson(doc.data())).toList(),
      );

  static Future<User?> readUser() async{
    final docUser= FirebaseFirestore.instance.collection('users').doc('my-id');
    final snapshot = await docUser.get();
    if(snapshot.exists){
      return User.fromJson(snapshot.data()!);
    }

  }
}