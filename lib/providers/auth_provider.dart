import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_clean_architecture/providers/shared_pref_provider.dart';
import 'package:riverpod_clean_architecture/screens/home_screen.dart';
import 'package:riverpod_clean_architecture/data/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

enum AuthState { initial, loading, authenticated, error, logout }

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState.initial);

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      state = AuthState.loading;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print("userCredential = $userCredential");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(Constants.prefSaveUserData, jsonEncode(saveUserData(userCredential)));
        prefs.setString(Constants.prefSaveLoginToken, userCredential.credential?.accessToken ?? "");
        prefs.setBool(Constants.prefIsUserLoggedIn, true);
        state = AuthState.authenticated;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        throw 'Google Sign-In failed.';
      }
    } catch (e) {
      state = AuthState.error;
      throw 'Error: $e';
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    state = AuthState.logout;
  }

  UserData saveUserData(UserCredential userCredential) {
    final userInfo = userCredential.additionalUserInfo;
    final profile = userInfo?.profile;
    final user = userCredential.user;

    final UserData userData = UserData(
        userId: profile?["id"],
        name: profile?["name"],
        imageUrl: profile?["picture"],
        email: profile?["email"],
        isEmailVerified: profile?["verified_email"],
        isAnonymous: user?.isAnonymous ?? true,
        isNewUser: userInfo?.isNewUser ?? false);

    return userData;
  }
}
