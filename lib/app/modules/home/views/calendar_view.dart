import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:colega_apps/app/components/daily_card.dart';
import 'package:colega_apps/app/components/task_card.dart';
import 'package:colega_apps/app/modules/home/controllers/home_controller.dart';
import 'package:colega_apps/app/modules/home/views/new_task_view.dart';
import 'package:colega_apps/constant.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class CalendarView extends GetView<HomeController> {
  CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calendar",
            style: poppinsBold.copyWith(fontSize: 24, color: Colors.black),
          ),
          Obx(() => Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      width: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: controller.isMonthly.value ==
                                      true
                                  ? MaterialStateProperty.all(primaryRed)
                                  : MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            controller.isMonthly.value = true;
                          },
                          child: Text(
                            'Monthly',
                            style: poppinsBold.copyWith(
                                fontSize: 24,
                                color: controller.isMonthly.value == true
                                    ? Colors.white
                                    : primaryRed),
                          )),
                    ),
                    Container(
                      width: 160,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: controller.isMonthly.value ==
                                      false
                                  ? MaterialStateProperty.all(primaryRed)
                                  : MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            controller.isMonthly.value = false;
                          },
                          child: Text(
                            'Daily',
                            style: poppinsBold.copyWith(
                                fontSize: 24,
                                color: controller.isMonthly.value == false
                                    ? Colors.white
                                    : primaryRed),
                          )),
                    ),
                    Spacer()
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Obx(() => controller.isMonthly.value == true
                ? monthlyCalendar()
                : dailyCalendar()),
          )
        ],
      ),
    ));
  }
}

Widget monthlyCalendar() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 280,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
                calendarViewMode: DatePickerMode.day,
                selectedDayHighlightColor: primaryRed),
            value: [DateTime.now()],
          ),
        ),
        Center(
          child: Container(
            width: 300,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryRed)),
                onPressed: () {
                  Get.to(() => NewTaskView());
                },
                child: Text(
                  '+ Create a new task',
                  style: poppinsRegular,
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Progress Task',
          style: poppinsBold.copyWith(fontSize: 16, color: Colors.black),
        ),
        SizedBox(height: 180, child: reminderList())
      ],
    ),
  );
}

Widget dailyCalendar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 100,
        child: DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: primaryRed,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
            print(date);
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Progress Task',
        style: poppinsBold.copyWith(fontSize: 16, color: Colors.black),
      ),
      SizedBox(
          width: double.infinity, height: 400, child: priorityReminderList()),
    ],
  );
}

Widget reminderList() {
  return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => TaskCard(model: sampleData[index]),
      itemCount: sampleData.length);
}

Widget priorityReminderList() {
  List<String> list = <String>[
    'Select Priority',
    'High Prority',
    'Medium Prority',
    'Low Prority'
  ];
  String dropdownValue = list.first;
  return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Row(children: [
            Expanded(
              flex: 2,
              child: Container(
                child: DailyCard(
                  model: sampleData[index],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
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
                width: 30,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 30,
                  ),
                  elevation: 16,
                  style:
                      poppinsMedium.copyWith(fontSize: 8, color: Colors.black),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: priorityItem(value),
                    );
                  }).toList(),
                ),
              ),
            )
          ]),
      itemCount: sampleData.length);
}

Widget priorityItem(String value) {
  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: primaryRed, borderRadius: BorderRadius.circular(10)),
      ),
      SizedBox(
        width: 5,
      ),
      Text(value, style: poppinsMedium.copyWith(fontSize: 8)),
    ],
  );
}
