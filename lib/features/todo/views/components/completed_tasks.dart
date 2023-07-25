import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/utils/todo_utils.dart';
import 'package:todo_app/features/todo/views/add_or_edit_task_screen.dart';
import 'package:todo_app/features/todo/views/components/todo_tile.dart';

class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskProvider);

    return FutureBuilder(
      future: TodoUtils.getCompletedTasksForToday(allTasks),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          debugPrint('Snapshot length: ${snapshot.data?.length}');
          if (snapshot.data!.isEmpty) {
            return Center(
              child: ReusableText(text: 'No Completed tasks for today', style: appstyle(18, AppColors.light, FontWeight.bold)),
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
                  onDelete: () {
                    ref.watch(taskProvider.notifier).deleteTask(task.id!);
                  },
                  onEdit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddOrEditTaskScreen(task),
                        ));
                  },
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
