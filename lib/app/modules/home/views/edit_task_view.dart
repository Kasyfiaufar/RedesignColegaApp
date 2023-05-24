import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditTaskView extends GetView {
  EditTaskView({Key? key}) : super(key: key);
  List<String> list = <String>['Category', 'College', 'Work', 'Organization'];
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Task Name',
              hintText: 'Input Here your details..',
              labelStyle: poppinsMedium.copyWith(fontSize: 16),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 160,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: poppinsMedium.copyWith(fontSize: 16),
                    hintText: '02/02/2021',
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        );
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 160,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Time',
                    labelStyle: poppinsMedium.copyWith(fontSize: 16),
                    hintText: '08:00',
                    suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        icon: Icon(Icons.access_time, color: Colors.black)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: poppinsMedium.copyWith(fontSize: 16, color: Colors.black),
              onChanged: (String? value) {
                // This is called when the user selects an item.
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Input Here your details..',
              labelStyle: poppinsMedium.copyWith(fontSize: 16),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text('Sub task list',
                  style: poppinsMedium.copyWith(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Text('Sub task 1',
                      style: poppinsRegular.copyWith(
                          fontSize: 14, color: Colors.grey)),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: primaryRed,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 30,
                      )),
                ],
              )),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryRed),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text('Cancel',
                        style: poppinsMedium.copyWith(
                            fontSize: 16, color: primaryRed)),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    color: primaryRed, borderRadius: BorderRadius.circular(5)),
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
    ));
  }
}
