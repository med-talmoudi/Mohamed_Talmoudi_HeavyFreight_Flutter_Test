import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heavyfreight/core/extensions/spacing.dart';

class WeightCard extends StatelessWidget {
  final String weight;
  final String size;
  final String svgURL;
  final bool isSelected;
  final double width;
  final double height;
  final VoidCallback onTap;

  const WeightCard({
    super.key,
    required this.weight,
    required this.size,
    required this.svgURL,
    required this.isSelected,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100.w,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected
                    ? const Color.fromRGBO(234, 94, 41, 1)
                    : Colors.transparent,
                width: 3.w,
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    weight,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                  child: SvgPicture.asset(
                    'assets/$svgURL',
                    width: width,
                    height: height,
                  ),
                ),
                Text(
                  size,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                5.vs,
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: -16.h,
              right: -11.w,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 82, 75, 75),
                ),
                child: SvgPicture.asset(
                  'assets/check.svg',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
