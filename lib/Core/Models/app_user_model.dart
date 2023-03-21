class AppUserModel {
  String? schoolName;
  String? email;
  String? mobileNo;
  String? city;
  String? addres;
  String? username;
  String? password;
  String? language;

  AppUserModel(
      {this.schoolName,
      this.email,
      this.mobileNo,
      this.city,
      this.addres,
      this.username,
      this.password,
      this.language});

  AppUserModel.fromJson(Map<String, dynamic> json) {
    schoolName = json['SchoolName'];
    email = json['Email'];
    mobileNo = json['MobileNo'];
    city = json['City'];
    addres = json['Addres'];
    username = json['Username'];
    password = json['Password'];
    language = json['Language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SchoolName'] = schoolName;
    data['Email'] = email;
    data['MobileNo'] = mobileNo;
    data['City'] = city;
    data['Addres'] = addres;
    data['Username'] = username;
    data['Password'] = password;
    data['Language'] = language;
    return data;
  }
}
