import 'package:colega_apps/app/data/models/ReminderModel.dart';
import 'package:colega_apps/app/modules/home/controllers/home_controller.dart';
import 'package:colega_apps/app/modules/home/views/detail_task_view.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DailyCard extends StatelessWidget {
  final ReminderModel model;
  DailyCard({super.key, required this.model});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailTaskView(model)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 60,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
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
                    style: poppinsBold.copyWith(fontSize: 12),
                  ),
                  Text(
                    'Deadline: ${model.time}',
                    style: poppinsRegular.copyWith(fontSize: 8),
                  )
                ],
              ),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text('70 %', style: poppinsBold.copyWith(fontSize: 8)),
                  CircularProgressIndicator(
                    value: 100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                    semanticsValue: "80",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
