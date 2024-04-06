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
    return sharedPreferences.setBool(
        Constants.PREF_FIRST_LAUNCH, isFirstLaunch);
  }

  bool isFirstLaunch() {
    return sharedPreferences.getBool(Constants.PREF_FIRST_LAUNCH) ?? true;
  }

  Future<bool> setIsLoggedInUser({required bool isLoggedInUser}) {
    return sharedPreferences.setBool(
        Constants.PREF_IS_USER_LOGGED_IN, isLoggedInUser);
  }

  bool isLoggedInUser() {
    return sharedPreferences.getBool(Constants.PREF_IS_USER_LOGGED_IN) ?? false;
  }
}
