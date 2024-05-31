import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharePreferencesUtils = Provider((ref) {
  final sharePrefs = ref.watch(sharedPreferencesProvider);
  return SharedPref(sharedPreferences: sharePrefs);
});

class SharedPref {
  SharedPref({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  Future<bool> setFirstLaunch({required bool isFirstLaunch}) {
    return sharedPreferences.setBool(Constants.prefFirstLaunch, isFirstLaunch);
  }

  bool isFirstLaunch() {
    return sharedPreferences.getBool(Constants.prefFirstLaunch) ?? true;
  }

  Future<bool> setIsLoggedInUser({required bool isLoggedInUser}) {
    return sharedPreferences.setBool(
        Constants.prefIsUserLoggedIn, isLoggedInUser);
  }

  bool isLoggedInUser() {
    return sharedPreferences.getBool(Constants.prefIsUserLoggedIn) ?? false;
  }

  Future<bool> saveLoginToken({required String token}) {
    return sharedPreferences.setString(Constants.prefSaveLoginToken, token);
  }

  String getSavedLoginToken() {
    return sharedPreferences.getString(Constants.prefSaveLoginToken) ?? "";
  }

  Future<bool> saveUserData({required String token}) {
    return sharedPreferences.setString(Constants.prefSaveLoginToken, token);
  }

  String getUserData() {
    var userData = sharedPreferences.getString(Constants.prefSaveLoginToken) ?? "";
    return jsonDecode(userData);
  }
}
