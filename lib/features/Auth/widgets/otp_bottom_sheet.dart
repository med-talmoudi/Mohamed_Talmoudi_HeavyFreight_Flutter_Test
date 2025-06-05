// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavyfreight/core/extensions/spacing.dart';
import 'package:heavyfreight/features/Auth/widgets/resend_timer.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

void showOtpBottomSheet(BuildContext context) {
  final GlobalKey<ResendOtpState> resendOtpKey = GlobalKey<ResendOtpState>();

  final controller = TextEditingController();
  final focusNode = FocusNode();
  bool isOtpValid = false;
  bool loading = false;
  bool otpError = false;
   @override
  

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 55.h,
    textStyle: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(70, 69, 66, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: const Color.fromRGBO(234, 94, 41, 1)),
      color: const Color.fromRGBO(233, 236, 239, 1),
      boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.05),
          offset: Offset(0, 3.h),
          blurRadius: 16.r,
        ),
      ],
    ),
  );
  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21.w,
      height: 1.h,
      margin:  EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
    ),
  );

  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return FractionallySizedBox(
            heightFactor: 0.66.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 50.h,
                        color: const Color.fromRGBO(234, 94, 41, 1),
                      ),
                    ),
                  ),
                  30.vs,
                  Center(
                    child: Text(
                      "OTP Verification",

                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  8.vs,

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Please write the OTP code that we sent to your registred Email to complete your verification",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                    ),
                  ),
                  20.vs,
                  Pinput(
                    length: 4,
                    controller: controller,
                    onChanged: (text) {
                      setState(() {
                        isOtpValid = text.length == 4;
                      });
                    },
                    focusNode: focusNode,
                    defaultPinTheme: otpError
                        ? defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(color: Colors.red, width: 2),

                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                                  offset: Offset(0, 3.h),
                                  blurRadius: 16.r,
                                ),
                              ],
                            ),
                          )
                        : defaultPinTheme.copyWith(),
                    separatorBuilder: (index) => SizedBox(width: 16.w),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.05),
                            offset: Offset(0, 3.h),
                            blurRadius: 16.r,
                          ),
                        ],
                      ),
                    ),
                    showCursor: false,
                    cursor: cursor,
                  ),
                  15.vs,
                  if (otpError)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Invalid OTP, please try again",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  12.vs,

                  // Countdown text
                  Center(child: ResendOtp(key: resendOtpKey)),

                  20.vs,

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    child: Opacity(
                      opacity: isOtpValid ? 1.0 : 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          minimumSize: Size(double.infinity, 50.h),
                          backgroundColor: const Color.fromRGBO(234, 94, 41, 1),

                          //  Color.fromRGBO(234, 94, 41, 1),
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          if (isOtpValid) {
                            setState(() {
                              loading = true;
                              otpError = false;
                            });
                            // Simulate a network request
                            await Future.delayed(const Duration(seconds: 3), () {});
                            if (controller.text == "1234") {
                              setState(() {
                                loading = false;
                                otpError = false;
                              });

                              // Simulate successful OTP verification
                              showGeneralDialog(
                                barrierDismissible: false,
                                barrierLabel: '',
                                barrierColor: const Color.fromARGB(
                                  95,
                                  11,
                                  6,
                                  37,
                                ),

                                transitionDuration: const Duration(
                                  milliseconds: 300,
                                ),
                                pageBuilder: (ctx, anim1, anim2) => GestureDetector(
                                  onTap: () {},
                                  child: PopScope(
                                    canPop: false,
                                    child: Lottie.asset(
                                      'assets/animations/success_animation.json',
                                      repeat: false,
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ),
                                ),
                                transitionBuilder: (ctx, anim1, anim2, child) =>
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 2 * anim1.value,
                                        sigmaY: 2 * anim1.value,
                                      ),
                                      child: FadeTransition(
                                        opacity: anim1,
                                        child: child,
                                      ),
                                    ),
                               
                                context: context,
                              );
                              await Future.delayed(const Duration(seconds: 2), () {});
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.pop(context);
                              controller.clear();
                              focusNode.unfocus();


                              
                              Navigator.pushNamed(context, '/package_form');
                            } else {
                              setState(() {
                                otpError = true;
                              });
                              // Show error if OTP is incorrect
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                          // Handle OTP verification
                        },

                        child: loading
                            ? Center(
                                child: SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child:  CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3.w,
                                  ),
                                ),
                              )
                            : Text(
                                "Verify",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),

                  20.vs,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn’t receive the code?",
                          style:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (resendOtpKey.currentState?.timeLeft == 0) {
                              resendOtpKey.currentState?.resetTimer();
                              Fluttertoast.showToast(
                                msg:
                                    "OTP resent successfully \n \t code is 1234",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 3,
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  2,
                                  129,
                                  40,
                                ),
                                textColor: Colors.white,
                                fontSize: 16.0.sp,
                              );
                            }
                          },

                          child: const Text(
                            "Resend",
                            style: TextStyle(
                              color: Color.fromRGBO(234, 94, 41, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
