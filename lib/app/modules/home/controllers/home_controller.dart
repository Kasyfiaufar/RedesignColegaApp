import 'package:colega_apps/app/modules/home/views/calendar_view.dart';
import 'package:colega_apps/app/modules/home/views/dashboard_view.dart';
import 'package:colega_apps/app/modules/home/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  final RxInt tabIndex = 0.obs;
  final RxBool isMonthly = true.obs;
  final RxBool isCustom = false.obs;
  final RxBool priorityButton = false.obs;

  late TabController tabController;

  final List<Widget> pages = [DashboardView(), CalendarView(), ProfileView()];

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
