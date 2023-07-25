import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/utils/todo_utils.dart';
import 'package:todo_app/features/todo/views/components/todo_tile.dart';

class ActiveTasks extends ConsumerWidget {
  const ActiveTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskProvider);

    return FutureBuilder(
      future: TodoUtils.getActiveTasksForToday(allTasks),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          debugPrint('Snapshot length: ${snapshot.data?.length}');
          if (snapshot.data!.isEmpty) {
            return Center(
              child: ReusableText(text: 'No Pending tasks for today', style: appstyle(18, AppColors.light, FontWeight.bold)),
            );
          }
          return ColoredBox(
            color: AppColors.yellow,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final task = snapshot.data![index];
                final isLast = index == snapshot.data!.length - 1;
                return ToDoTile(
                  task: task,
                  bottomMargin: isLast ? null : 10,
                  onDelete: () {},
                  onEdit: () {},
                  endIcon: Switch(
                    value: task.isCompleted,
                    onChanged: (value) {
                      task.isCompleted = true;
                      ref.read(taskProvider.notifier).markAsCompleted(task);
                    },
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
