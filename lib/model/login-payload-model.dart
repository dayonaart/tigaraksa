import 'package:flutter/material.dart';

class LoginPayloadModel {
  String keyBlank;
  String email;
  String password;

  LoginPayloadModel({
    @required this.keyBlank,
    @required this.email,
    @required this.password,
  });

  LoginPayloadModel.fromJson(Map<String, dynamic> json) {
    keyBlank = json['keyBlank'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyBlank'] = this.keyBlank;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
