class DoctorListModel {
  String? id;
  String? name;
  String? image;
  String? gender;
  String? time;
  String? location;
  String? department;

  DoctorListModel(
      {this.id,
      this.name,
      this.image,
      this.gender,
      this.time,
      this.location,
      this.department});

  DoctorListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    gender = json['gender'];
    time = json['time'];
    location = json['location'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['time'] = this.time;
    data['location'] = this.location;
    data['department'] = this.department;
    return data;
  }
}



