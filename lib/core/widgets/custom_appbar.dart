import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: null,

    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 0,

    title: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.west,
            size: 30.sp,
            color: const Color.fromARGB(255, 69, 8, 8),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
    centerTitle: false,
    actions: [
      Padding(
        padding: EdgeInsets.fromLTRB(0.w, 0, 12.w, 6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "HeavyFreight",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "TRANSPORTATION",
              style: TextStyle(
                fontSize: 6.sp,
                color: const Color.fromRGBO(234, 94, 41, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
