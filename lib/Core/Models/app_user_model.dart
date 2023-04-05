class AppUserModel {
  String? schoolName;
  String? email;
  String? mobileNo;
  String? city;
  String? addres;
  String? username;
  String? password;
  String? language;
  String? imageUrl;

  AppUserModel(
      {this.schoolName,
      this.email,
      this.mobileNo,
      this.city,
      this.addres,
      this.username,
      this.password,
      this.language,
      this.imageUrl});

  AppUserModel.fromJson(Map<String, dynamic> json) {
    schoolName = json['SchoolName'];
    email = json['Email'];
    mobileNo = json['MobileNo'];
    city = json['City'];
    addres = json['Addres'];
    username = json['Username'];
    password = json['Password'];
    language = json['Language'];
    imageUrl = json['imageUrl'];
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
    data['imageUrl'] = imageUrl;
    return data;
  }
}
