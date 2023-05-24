import 'package:colega_apps/app/components/task_card.dart';
import 'package:colega_apps/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'notifikasi_view.dart';

class DashboardView extends GetView {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [heroAtas(), reminderList()],
      ),
    );
  }
}

Widget heroAtas() {
  return Container(
    width: double.infinity,
    height: 300,
    child: Stack(children: [
      Positioned(
          right: 0,
          left: 0,
          child: Image.asset(
            'assets/wave.png',
            fit: BoxFit.cover,
          )),
      Positioned(
          left: 20,
          top: 32,
          child: Text(
            "Halo, Kasyfi!",
            style: poppinsBold.copyWith(fontSize: 24, color: Colors.white),
          )),
      Positioned(
        right: 20,
        top: 28,
        child: IconButton(
          onPressed: () {
            Get.to(() => NotifikasiView());
          },
          icon: Icon(
            Icons.notifications_outlined,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
          right: 32,
          top: 110,
          child: Container(
              width: 170,
              height: 170,
              child: Image.asset('assets/maskot.png', fit: BoxFit.cover))),
      Positioned(
        left: 20,
        top: 100,
        child: Container(
          padding: EdgeInsets.all(12),
          width: 170,
          height: 140,
          decoration: BoxDecoration(
              color: primaryBrown, borderRadius: BorderRadius.circular(20)),
          child: Flexible(
              child: Text(
            'Nama saya colega! Bagaimana kabarmu hari ini? Jangan lupa di cek yuk kalendernya agar tidak ada aktivitas yang terlewat',
            style: poppinsMedium.copyWith(fontSize: 12, color: Colors.white),
          )),
        ),
      )
    ]),
  );
}

Widget reminderList() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reminder List',
            style: poppinsBold.copyWith(fontSize: 18, color: primaryRed),
          ),
          SingleChildScrollView(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    TaskCard(model: sampleData[index]),
                itemCount: sampleData.length),
          ),
        ],
      ),
    ),
  );
}
