import 'package:colega_apps/app/data/models/ReminderModel.dart';
import 'package:colega_apps/app/modules/home/controllers/home_controller.dart';
import 'package:colega_apps/app/modules/home/views/edit_task_view.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DetailTaskView extends GetView<HomeController> {
  final ReminderModel model;
  const DetailTaskView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: primaryBrown,
                  )),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Get.to(() => EditTaskView());
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 40,
                    color: primaryBrown,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    model.title,
                    style: poppinsBold.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date',
                            style: poppinsMedium.copyWith(fontSize: 16)),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 24,
                              color: primaryRed,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              model.date,
                              style: poppinsLight.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time',
                            style: poppinsMedium.copyWith(fontSize: 16)),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 24,
                              color: primaryRed,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              model.time,
                              style: poppinsLight.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',
                          style: poppinsMedium.copyWith(fontSize: 16)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        model.description,
                        style: poppinsLight.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text('Sub task list',
                    style: poppinsMedium.copyWith(fontSize: 16)),
                SizedBox(height: 150, child: subTaskList()),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryRed),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text('Remove',
                            style: poppinsMedium.copyWith(
                                fontSize: 16, color: primaryRed)),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                          color: primaryRed,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text('Save',
                            style: poppinsMedium.copyWith(
                                fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

Widget subTaskList() {
  return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => GestureDetector(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      sampleSubTask[index],
                      style: poppinsMedium.copyWith(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 30,
                    child: RadioListTile(
                      activeColor: primaryRed,
                      toggleable: true,
                      value: sampleSubTask[index],
                      groupValue: '', //TODO: add group value
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
            ),
          ),
      itemCount: sampleSubTask.length);
}
