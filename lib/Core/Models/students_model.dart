class StudentModel {
  String? studentN;
  String? studentG;
  String? studentC;
  String? studentDOB;
  String? studentBG;
  String? studentR;
  String? studentAD;
  String? fatherN;
  String? motherN;
  String? parentE;
  String? parentP;
  String? parentO;
  String? parentA;
  String? parentR;
  String? image;
  String? studentID;
  String? parentID;

  StudentModel(
      {this.studentN,
      this.studentG,
      this.studentC,
      this.studentDOB,
      this.studentBG,
      this.studentR,
      this.studentAD,
      this.fatherN,
      this.motherN,
      this.parentE,
      this.parentP,
      this.parentO,
      this.parentA,
      this.parentR,
      this.studentID,
      this.image,
      this.parentID});

  StudentModel.fromJson(Map<String, dynamic> json) {
    studentN = json['studentN'];
    studentG = json['studentG'];
    studentC = json['studentC'];
    studentDOB = json['studentDOB'];
    studentBG = json['studentBG'];
    studentR = json['studentR'];
    studentAD = json['studentAD'];
    fatherN = json['fatherN'];
    motherN = json['motherN'];
    parentE = json['parentE'];
    parentP = json['parentP'];
    parentO = json['parentO'];
    parentA = json['parentA'];
    parentR = json['parentR'];
    studentID = json['studentID'];
    image = json['image'];
    parentID = json['parentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentN'] = studentN;
    data['studentG'] = studentG;
    data['studentC'] = studentC;
    data['studentDOB'] = studentDOB;
    data['studentBG'] = studentBG;
    data['studentR'] = studentR;
    data['studentAD'] = studentAD;
    data['fatherN'] = fatherN;
    data['motherN'] = motherN;
    data['parentE'] = parentE;
    data['parentP'] = parentP;
    data['parentO'] = parentO;
    data['parentA'] = parentA;
    data['parentR'] = parentR;
    data['studentID'] = studentID;
    data['parentID'] = parentID;
    return data;
  }
}
