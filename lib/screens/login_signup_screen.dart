import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class LoginSignupScreen extends ConsumerStatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreen createState() => _LoginSignupScreen();
}

class _LoginSignupScreen extends ConsumerState<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            if (authState == AuthState.loading) {
              return const CircularProgressIndicator();
            } else if (authState == AuthState.authenticated) {
              return Container(); // Return an empty container temporarily while navigating
            } else if (authState == AuthState.error) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error: An error occurred during authentication.'),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).signInWithGoogle(context);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else {
              return Column(
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
                      onPressed: () async {
                        await ref
                            .read(authProvider.notifier)
                            .signInWithGoogle(context);
                      },
                      child: const Text('Login with Gmail!')),
                  const SizedBox(
                    height: 48,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
