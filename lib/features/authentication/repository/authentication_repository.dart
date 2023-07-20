import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utilities/core_utils.dart';
import 'package:todo_app/features/authentication/views/otp_page.dart';

class AuthenticationRepository {
  const AuthenticationRepository({
    required this.auth,
  });
  final FirebaseAuth auth;

  Future<void> sendOTP({required String phoneNumber, required BuildContext context}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) {
        auth.signInWithCredential(credential);
      },
      verificationFailed: (error) {
        CoreUtils.showSnackBar(context: context, message: '${error.code}: ${error.message}');
        print('${error.code}: ${error.message}');
      },
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OTPVerificationScreen(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
