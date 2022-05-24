class Datamodel {
  String? name;
  String? birthDate;
  String? uid;
  String? email;
  String? phone;
  String? password;

  Datamodel(
      {this.name,
      this.birthDate,
      this.email,
      this.phone,
      this.password,
      this.uid});

  // from map which reads the data from the database

  factory Datamodel.fromMap(Map<String, dynamic> json) => Datamodel(
        uid: json["uid"],
        name: json["name"],
        birthDate: json["birthDate"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
      );

// to map use to send a data to firestore database
  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "birthDate": birthDate,
        "password": password,
        "phone": phone
      };
}
