import 'package:colega_apps/app/components/notif_card.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotifikasiView extends GetView {
  const NotifikasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
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
              Center(
                child: Text('Aktifkan Notifikasi',
                    style: poppinsBold.copyWith(
                        fontSize: 24, color: Colors.black)),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
          Expanded(
            child: reminderList(),
          )
        ],
      ),
    ));
  }
}

Widget reminderList() {
  return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => NotifCard(model: sampleData[index]),
      itemCount: sampleData.length);
}
