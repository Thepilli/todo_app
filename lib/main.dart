import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/features/authentication/app/user_provider.dart';
import 'package:todo_app/features/on_boarding/views/on_boarding_screen.dart';
import 'package:todo_app/features/todo/views/home_page.dart';
import 'package:todo_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    return ScreenUtilInit(
      designSize: const Size(411.4, 866.3),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.darkBackground,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            useMaterial3: true,
          ),
          home: ref.watch(userProvider).when(
            data: (userExists) {
              if (userExists) return const HomePage();
              return const OnBoardingScreen();
            },
            error: (error, stackTrace) {
              print('ERROR: $error');
              print(stackTrace.toString());
              return const OnBoardingScreen();
            },
            loading: () {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        );
      },
    );
  }
}
