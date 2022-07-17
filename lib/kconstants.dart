import 'package:flutter/material.dart';

const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kBlackColor = Color(0xFF000000);
const Color kGreyColor = Color(0xFFB0B0B0);

const Color kOrangeColor = Color(0xFFFF6600);

const Color kPrimaryTextColor = Color(0xFF393939);

const kTabText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kShoeCategory = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
const kShoeName = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);

const kShoePrice = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
);

const kSplitText = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);

const curlBox = BoxDecoration(
  color: Color.fromARGB(255, 247, 247, 247),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(1),
    bottomRight: Radius.circular(1),
  ),
);

const kBottomBar = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40),
    topRight: Radius.circular(40),
  ),
);

const kCircleBox = BorderRadius.only(
  topLeft: Radius.circular(90),
  topRight: Radius.circular(90),
  bottomLeft: Radius.circular(90),
  bottomRight: Radius.circular(90),
);

const kSquircle = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
  bottomLeft: Radius.circular(20),
  bottomRight: Radius.circular(20),
);
