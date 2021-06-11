import 'package:flutter/material.dart';

class RegisterPayloadModel {
  String keyBlank;
  String phone;
  String name;
  String password;
  String email;

  RegisterPayloadModel({
    @required this.keyBlank,
    @required this.phone,
    @required this.name,
    @required this.password,
    @required this.email,
  });

  RegisterPayloadModel.fromJson(Map<String, dynamic> json) {
    keyBlank = json['keyBlank'];
    phone = json['phone'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyBlank'] = this.keyBlank;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
