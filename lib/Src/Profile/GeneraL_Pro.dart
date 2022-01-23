class GeneralPro {
  String? name;
  String? location;
  String? phoneNumber;
  // the uid from firebase auth service

  GeneralPro({this.name, this.location, this.phoneNumber});

  // from map which reads the data from the database

  factory GeneralPro.fromMap(Map<String, dynamic> json) => GeneralPro(
      name: json["name"],
      location: json["location"],
      phoneNumber: json["phoneNumber"]);

  // toMap()
  Map<String, dynamic> toMap() => {
        "name": name,
        "location": location,
        "phoneNumber": phoneNumber,
      };
}
