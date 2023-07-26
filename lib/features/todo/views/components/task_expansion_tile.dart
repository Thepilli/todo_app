import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/.fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';

class TaskExpansionTile extends StatefulWidget {
  const TaskExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.color,
  });
  final String title;
  final String subtitle;
  final List<Widget> children;
  final Color? color;

  @override
  State<TaskExpansionTile> createState() => _TaskExpansionTileState();
}

class _TaskExpansionTileState extends State<TaskExpansionTile> {
  final controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.darkBackgroundContainer, borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value) => setState(() {}),
          controller: controller,
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const WhiteSpace(width: 15),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadingText(
                        text: widget.title,
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const WhiteSpace(width: 15),
                      FadingText(
                        text: widget.subtitle,
                        fontSize: 12,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Builder(
              builder: (secondContext) {
                final innerController = ExpansionTileController.of(secondContext);
                return Icon(
                  innerController.isExpanded ? AntDesign.closecircleo : AntDesign.circledown,
                  color: innerController.isExpanded ? AppColors.notCompleted : AppColors.tPrimaryColor,
                );
              },
            ),
          ),
          children: widget.children,
        ),
      ),
    );
  }
}
