import 'dart:convert';

import 'package:ejemplo_disenos_firebase/global/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier {
  Future<String?> loginUser(String email, String password) async {
    Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
        '${Environment.urlBase}',
        'v1/accounts:signInWithPassword',
        {'key': '${Environment.firebaseToken}'});

    final respuesta = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(respuesta.body);
  }
}
