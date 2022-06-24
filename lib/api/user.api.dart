import 'package:chatonline/model/message.dart';
import 'package:chatonline/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class UserApi {
  static Future createUser({required User usuario}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(
      id: docUser.id,
      name: usuario.name,
      age: usuario.age,
      birthday: usuario.birthday,
      foto: usuario.foto,
    );
    final json = user.toJson();
    await docUser.set(json);
  }

  static DateTime toDateTime(Timestamp value) {
    if (value == null) return DateTime.now();
    return value.toDate();
  }

  static Future uploadMessage({
    required String message,
    required User user,
  }) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chatonline/${user.id}/messages');
    final newMessage = Messagem(
      iduser: user.id,
      urlAvatar: user.foto,
      userName: user.name,
      message: message,
      createAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());
    final refUsers=FirebaseFirestore.instance.collection('users');
    await refUsers.doc(user.id).update({'birthday': DateTime.now()});
  }

  static Stream<List<User>> readUsers() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) =>
                snapshot.docs.map((doc) => User.fromJson(doc.data())).toList(),
          );

  static Future<List<User>> listFutureUser() async {
    List<User> lista = <User>[];
    var teste = FirebaseFirestore.instance.collection('users').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => User.fromJson(doc.data())).toList(),
        );
    await for (final value in teste) {
      lista.add(value as User);
    }

    return lista.toList();
  }

  static Future<User?> readUser() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }
}
