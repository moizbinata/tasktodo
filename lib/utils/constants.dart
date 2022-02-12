import 'package:flutter/material.dart';

class Constants {
  static const baseUrl = "https://itsuppudhaivi.com/";
  static const primaryColor = Color(0xff7646FF); //#4CCB41
  static const green = Color(0xff4CCB41); //FC5565
  static const pink = Color(0xff4CCB41); //#707070
  static const grey = Color(0xff707070); //##172735
  static const blackGrey = Color(0xff172735); //##172735

  static final iconColor = const Color(0xff0C1A32).withOpacity(0.4);
  static const black = Colors.black;
  // static final requiredValidator =
  //     RequiredValidator(errorText: 'this field is required');
  static Widget loader() => const Center(
          child: CircularProgressIndicator(
        backgroundColor: Constants.primaryColor,
        color: Constants.primaryColor,
      ));

  // static Future<SharedPreferences> init() async {
  //   prefs = await _instance;
  //   return prefs;
  // }
}
