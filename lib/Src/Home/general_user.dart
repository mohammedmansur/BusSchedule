import 'package:cloud_firestore/cloud_firestore.dart';

class GeneralUser {
  String? chat;
  Timestamp? date; // the uid from firebase auth service
  String? fullname;
  String? city;
  String? phone;
  String? email;
  String? password;

  GeneralUser(
      {this.chat,
      this.date,
      this.fullname,
      this.city,
      this.phone,
      this.email,
      this.password});

  // from map which reads the data from the database

  factory GeneralUser.fromMap(Map<String, dynamic> json) => GeneralUser(
      chat: json["chat"],
      date: json["Time"],
      fullname: json["fullname"],
      city: json["city"],
      phone: json["phone"],
      email: json["email"],
      password: json["password"]);

  // toMap()
  Map<String, dynamic> toMap() => {
        "chat": chat,
        "Time": date,
        "fullname": fullname,
        "city": city,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
