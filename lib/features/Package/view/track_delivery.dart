import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heavyfreight/core/extensions/spacing.dart';
import 'package:heavyfreight/core/widgets/custom_appbar.dart';

class TrackDelivery extends StatefulWidget {
  const TrackDelivery({super.key});

  @override
  State<TrackDelivery> createState() => _TrackDeliveryState();
}

class _TrackDeliveryState extends State<TrackDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Track Delivery"),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                Text(
                  "Order ID:",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                2.vs,
                Text(
                  "ORD-123456789",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],),
              10.vs,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'assets/track.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 260.0.h,
                  ),
                ),
              ),
              10.vs,
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Details",
            
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              10.vs,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Left Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoRow(
                            Icons.timer_outlined,
                            "30-45 min",
                            "Delivery time",
                          ),
                          16.vs,
                          _infoRow(
                            Icons.location_on_outlined,
                            "24 Av. Omar Ibn El Khattab",
                            "Your Address",
                          ),
                        ],
                      ),
                    ),
            
                    // Right Box - Weight
                    Container(
                      width: 75.w,
                      height: 127.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 99, 38,1),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15.h,
                        
                        children: [
                          CircleAvatar(
                             radius: 24.r,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/package_icon.svg',
                              width: 33.w,
                              height: 33.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          
                         Column(children: [
                           Text(
                            "6 kg",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          3.vs,
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: const Color.fromARGB(250, 254, 254, 254),
                              fontSize: 13.sp,
                            ),
                          ),
                          3.vs,
                         ],)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            
             30.vs,
            
              // Courier Info Row
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(216, 220, 224, 1),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    children: [
                      2.hs,
                      CircleAvatar(
                        radius: 23.r,
                        backgroundImage: const AssetImage('assets/courier.png'
                        ), // Replace with actual image
                      ),
                      12.hs,
                      Expanded(
                        child: Column(
                          spacing: 3.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Karim Younes",
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  fontSize: 18.sp, color: Colors.black),
                            ),
                            Text(
                              "Your courier",
                              style: TextStyle( fontSize:14.sp,color: const Color.fromARGB(255, 80, 80, 80)),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 25.r,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.chat, size: 30.sp,  color: const Color.fromRGBO(254, 99, 38,1),),
                      ),
                      2.hs,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoRow(IconData icon, String title, String subtitle) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
  
    children: [
      Container(
        width: 50.w,
        height: 50.h,
        decoration: const BoxDecoration(
          color:  Color(0xFFCCE197), // Light green
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 35.sp, color: Colors.black),
      ),
      12.hs,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            4.vs,
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    ],
  );
}
