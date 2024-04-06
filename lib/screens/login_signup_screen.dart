import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/providers/shared_pref_provider.dart';
import 'package:riverpod_clean_architecture/screens/home_screen.dart';

class LoginSignupScreen extends ConsumerWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Image(
              image: AssetImage('assets/images/products.png'),
              width: 100,
              height: 100,
            ),
            const Text(
              "India's Book Store",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              "Log in or sign up",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .watch(sharePreferencesUtils)
                      .setIsLoggedInUser(isLoggedInUser: true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text('Login with Gmail!')),
            const SizedBox(
              height: 48,
            )
          ],
        ),
      ),
    );
  }
}
