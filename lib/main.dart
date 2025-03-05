import 'package:dart/utils/constants.dart';
import 'package:dart/services/auth/auth_service.dart';
import 'package:dart/view/login_view.dart';
import 'package:dart/view/notes/create_update_notes_view.dart';
import 'package:dart/view/notes/notes_view.dart';
import 'package:dart/view/register_view.dart';
import 'package:dart/view/verified_email.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (_) => const LoginView(),
        registerRoute: (_) => const RegisterView(),
        notesRoute: (_) => const NotesView(),
        verifyEmailRoute: (_) => const VerifiedEmailView(),
        createOrUpdateNoteRoute: (_) => const CreateUpdateNoteView()
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifiedEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
