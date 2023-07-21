import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/helper/db_helper.dart';
import 'package:todo_app/core/utils/core_utils.dart';
import 'package:todo_app/features/authentication/views/otp_verification_page.dart';
import 'package:todo_app/features/todo/views/home_page.dart';

final authProvider = Provider((ref) => AuthenticationRepository(auth: FirebaseAuth.instance));

///JSON
// final testJson = {"name": "jiri", "age": 31};
// final serverReadableJson = jsonEncode(testJson);
// const serverJson = '{"name": "jiri", "age": 31}';
// final dartReadableMap = jsonDecode(serverJson);
// final name = dartReadableMap['name'];

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
      codeSent: (verificationId, _) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerificationScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String otp,
  }) async {
    try {
      void showSnack(String message) {
        return CoreUtils.showSnackBar(context: context, message: message);
      }

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final navigator = Navigator.of(context);
      final userCredential = await auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        await DBHelper.createUser(isVerified: true);
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
      } else {
        showSnack('Error Occured, Failed to sign up user');
      }
    } on FirebaseException catch (e) {
      CoreUtils.showSnackBar(context: context, message: '${e.code}: ${e.message}');
    } catch (e) {
      CoreUtils.showSnackBar(context: context, message: '505: Error Occured, Failed to sign up user');
    }
  }
}
