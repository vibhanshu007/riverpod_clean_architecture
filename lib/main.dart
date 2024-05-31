import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/firebase_options.dart';
import 'package:riverpod_clean_architecture/providers/shared_pref_provider.dart';
import 'package:riverpod_clean_architecture/screens/home_screen.dart';
import 'package:riverpod_clean_architecture/screens/intro_screen.dart';
import 'package:riverpod_clean_architecture/screens/login_signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider = Provider<SharedPref>((ref) {
  throw UnimplementedError();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final shredPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(shredPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFirstLaunch = ref.watch(sharePreferencesUtils).isFirstLaunch();
    final isLoggedInUser = ref.watch(sharePreferencesUtils).isLoggedInUser();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isFirstLaunch ? const IntroScreen() : isLoggedInUser ? const HomeScreen() : const LoginSignupScreen());
  }
}
