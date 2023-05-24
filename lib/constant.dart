import 'package:colega_apps/app/data/models/ReminderModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryWhite = HexColor("FFFFFF");
Color primaryBrown = HexColor("A02723");
Color primaryPink = HexColor("FC5E62");
Color secondaryPink = HexColor("F98F91");
Color primaryBlue = HexColor("051361");
Color secondaryBlue = HexColor("8FB9F9");
Color primaryPurple = HexColor("DE1BCB");
Color primaryRed = HexColor("DA1E37");

TextStyle poppinsBold = GoogleFonts.poppins(fontWeight: FontWeight.bold);
TextStyle poppinsMedium = GoogleFonts.poppins(fontWeight: FontWeight.w500);
TextStyle poppinsRegular = GoogleFonts.poppins(fontWeight: FontWeight.normal);
TextStyle poppinsLight = GoogleFonts.poppins(fontWeight: FontWeight.w300);

final List<ReminderModel> sampleData = [
  ReminderModel(
      title: "UX App Project",
      date: "23/05/2023",
      time: "23:30",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      category: "Work",
      subtask: "Design System"),
  ReminderModel(
      title: "Event Festival 2023",
      date: "23/05/2023",
      time: "23:30",
      description: "Description Here",
      category: "Organization",
      subtask: "Design System"),
  ReminderModel(
      title: "Event Festival 2024",
      date: "23/05/2023",
      time: "23:30",
      description: "Description Here",
      category: "Organization",
      subtask: "Design System"),
];

final List<String> sampleSubTask = ["Design System", "Wireframe"];
