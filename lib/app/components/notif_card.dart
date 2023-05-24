import 'package:colega_apps/app/data/models/ReminderModel.dart';
import 'package:colega_apps/app/modules/home/controllers/home_controller.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class NotifCard extends StatelessWidget {
  final ReminderModel model;
  NotifCard({super.key, required this.model});

  HomeController controller = Get.find();

  List<String> list = <String>['Pilih Hari', '1 Hari', '2 Hari', '3 Hari'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              children: [
                Text('Aktifkan Notifikasi',
                    style: poppinsBold.copyWith(
                        fontSize: 20, color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Text('Pilih Durasi Notifikasi sebelum deadline',
                    style: poppinsMedium.copyWith(
                        fontSize: 14, color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' Everyday',
                              style: poppinsMedium.copyWith(
                                  fontSize: 10, color: Colors.black)),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: primaryBrown,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: poppinsRegular.copyWith(
                                fontSize: 10, color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          controller.isCustom.value =
                              !controller.isCustom.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' Custom',
                                style: poppinsMedium.copyWith(
                                    fontSize: 10, color: Colors.black)),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //list of day button
                Obx(
                  () => controller.isCustom == false
                      ? Container()
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              listHari('Senin'),
                              listHari('Selasa'),
                              listHari('Rabu'),
                              listHari('Kamis'),
                              listHari('Jumat'),
                              listHari('Sabtu'),
                              listHari('Minggu'),
                            ],
                          ),
                        ),
                ),
                Spacer(),
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
                        child: Text('Cancel',
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
          ),
        );
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
                width: 16,
              ),
              Text(
                model.title,
                style: poppinsBold.copyWith(fontSize: 16),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listHari(String hari) {
  return Container(
    width: 60,
    height: 30,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
        color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$hari',
            style: poppinsMedium.copyWith(fontSize: 10, color: Colors.black)),
      ],
    ),
  );
}
