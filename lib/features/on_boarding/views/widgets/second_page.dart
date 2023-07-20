import 'package:flutter/material.dart';
import 'package:todo_app/core/common/widgets/my_material_button.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/strings/image_strings.dart';
import 'package:todo_app/features/authentication/views/login_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageStrings.todo),
        const WhiteSpace(height: 100),
        MyMaterialButton(
          buttonText: 'Login with phone',
          isEnabled: true,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          },
        ),
      ],
    );
  }
}
