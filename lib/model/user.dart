import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;
  final String foto;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
    required this.foto,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'birthday': birthday,
    'foto':foto,
  };

  static User fromJson(Map<String,dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    age: json['age'],
    birthday: (json['birthday'] as Timestamp).toDate(),
    foto: json['foto'],
  );
}
