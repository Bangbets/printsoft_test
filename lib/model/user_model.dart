// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//     UserModel({
//         this.username,
//         this.password,
//     });

//     String? username;
//     String? password;

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         username: json["username"],
//         password: json["password"],
//     );

//     Map<String, dynamic> toJson() => {
//         "username": username,
//         "password": password,
//     };
// }
