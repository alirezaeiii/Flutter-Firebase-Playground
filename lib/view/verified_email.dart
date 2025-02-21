import 'package:dart/utils/constants.dart';
import 'package:dart/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class VerifiedEmailView extends StatefulWidget {
  const VerifiedEmailView({super.key});

  @override
  State<VerifiedEmailView> createState() => _VerifiedEmailViewState();
}

class _VerifiedEmailViewState extends State<VerifiedEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: Column(
        children: [
          const Text("Verification email has already sent to you. If you've not receive click on the button bellow."),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendVerificationEmail();
            },
            child: const Text('Verify your email'),
          ),
          TextButton(
            onPressed: () {
              AuthService.firebase().signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute, (_) => false,
              );
            },
            child: const Text('You can login here'),
          )
        ],
      ),
    );
  }
}
