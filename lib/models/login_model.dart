class LoginModel {
  late final bool status;
  late final String message;
  late final Data? data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status']??'';
    message = json['message']??'';
    data = json['data']!=null ? Data.fromJson(json['data']):null;
  }

}

class Data {

  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final int credit;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??'';
    email = json['email']??'';
    phone = json['phone']??'';
    image = json['image']??'';
    points = json['points']??0;
    credit = json['credit']??0;
    token = json['token']??'';
  }

}




// class LoginModel {
//    bool status;
//    String message;
//    UserData data;
//
//   LoginModel(this.status, this.message, this.data);
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//         json['status'],
//         json['message'],
//         json['data'] != null ? (UserData.fromJson(json['data'])) : null!   //علشان الداتا ممكن تيجي بNULL
//     );
//
//     // status = json['status'];
//     // message = json['message'];
//     // data = json['data'] != null ? (UserData.fromJson(json['data'])) : null!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class UserData {
//    int id;
//    String name;
//    String email;
//    String phone;
//    String image;
//    int points;
//    int credit;
//    String token;
//
//   UserData(this.id, this.name, this.email, this.phone, this.image, this.points,
//       this.credit, this.token);
//
//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//         json['id'],
//         json['name'],
//         json['email'],
//         json['phone'],
//         json['image'],
//         json['points'],
//         json['credit'],
//         json['token']
//     );
//     // id = json['id'];
//     // name = json['name'];
//     // email = json['email'];
//     // phone = json['phone'];
//     // image = json['image'];
//     // points = json['points'];
//     // credit = json['credit'];
//     // token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['image'] = this.image;
//     data['points'] = this.points;
//     data['credit'] = this.credit;
//     data['token'] = this.token;
//     return data;
//   }
// }
