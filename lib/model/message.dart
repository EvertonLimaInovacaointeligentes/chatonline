import 'package:cloud_firestore/cloud_firestore.dart';

class Messagem{
  String iduser;
  final String userName;
  final String message;
  final String urlAvatar;
  final DateTime createAt;

  Messagem({
    this.iduser = '',
    required this.userName,
    required this.message,
    required this.urlAvatar,
    required this.createAt,
  });

  Map<String, dynamic> toJson() => {
    'idUser': iduser,
    'userName': userName,
    'message': message,
    'urlAvatar': urlAvatar,
    'createdAt':createAt,
  };

  static Messagem fromJson(Map<String,dynamic> json) => Messagem(
    iduser: json['idUser'],
    userName: json['userName'],
    message: json['message'],
    urlAvatar: json['urlAvatar'],
    createAt: (json['createAt'] as Timestamp).toDate(),
  );
}