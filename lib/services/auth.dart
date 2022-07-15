import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String? _token;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    _token = '';
    return _token;
    // if (_expiryDate != null &&
    //     _expiryDate!.isAfter(DateTime.now()) &&
    //     _token != null) {
    //   return _token;
    // }
    // return null;
  }

  Future<bool> tryAutoLogin() async {
    _token = '';
    return true;
  }
}
