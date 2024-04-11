import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_clean_architecture/screens/home_screen.dart';

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
}
