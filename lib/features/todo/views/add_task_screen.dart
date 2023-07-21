import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/common/widgets/custome_text_field.dart';
import 'package:todo_app/core/common/widgets/my_material_button.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(controller: titleController, hintText: 'Add Title', isObscured: false),
              CustomTextField(controller: descriptionController, hintText: 'Add Description', isObscured: false),
              MyMaterialButton(buttonText: 'buttonText', onPressed: () {}, isEnabled: true),
              Row(
                children: [
                  Expanded(child: MyMaterialButton(buttonText: 'buttonText', onPressed: () {}, isEnabled: true)),
                  Expanded(child: MyMaterialButton(buttonText: 'buttonText', onPressed: () {}, isEnabled: true)),
                ],
              ),
              MyMaterialButton(buttonText: 'buttonText', onPressed: () {}, isEnabled: true),
            ],
          ),
        ),
      ),
    );
  }
}
