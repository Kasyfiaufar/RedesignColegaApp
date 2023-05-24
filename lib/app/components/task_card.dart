import 'package:colega_apps/app/data/models/ReminderModel.dart';
import 'package:colega_apps/app/modules/home/views/detail_task_view.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TaskCard extends StatelessWidget {
  final ReminderModel model;
  const TaskCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailTaskView(model));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: model.category == "College"
                    ? secondaryBlue
                    : model.category == "Work"
                        ? primaryBlue
                        : model.category == "Personal"
                            ? primaryRed
                            : primaryPurple,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.title,
                    style: poppinsBold.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Deadline: ${model.time}',
                    style: poppinsRegular.copyWith(fontSize: 12),
                  )
                ],
              ),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text('70 %', style: poppinsBold.copyWith(fontSize: 10)),
                  CircularProgressIndicator(
                    value: 100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                    semanticsValue: "80",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
