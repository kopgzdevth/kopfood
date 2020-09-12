class UserModel {
  String id;
  String choosetype;
  String myname;
  String myuser;
  String mypassword;

  UserModel(
      {this.id, this.choosetype, this.myname, this.myuser, this.mypassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choosetype = json['choosetype'];
    myname = json['myname'];
    myuser = json['myuser'];
    mypassword = json['mypassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['choosetype'] = this.choosetype;
    data['myname'] = this.myname;
    data['myuser'] = this.myuser;
    data['mypassword'] = this.mypassword;
    return data;
  }
}
