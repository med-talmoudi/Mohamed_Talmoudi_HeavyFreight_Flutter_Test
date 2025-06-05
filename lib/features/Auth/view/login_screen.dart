import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavyfreight/core/extensions/spacing.dart';
import 'package:heavyfreight/features/Auth/widgets/otp_bottom_sheet.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberController = TextEditingController();
  final _formKeyRegister = GlobalKey<FormState>();
  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');
  bool loading = false;

  @override
  void dispose() {
    _phoneNumberController.dispose(); 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
       
        child: Stack(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/newbg.avif"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  30.vs,
                  Text(
                    "HeavyFreight",
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "TRANSPORTATION",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color.fromRGBO(234, 94, 41, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  40.vs,

                  Center(
                   
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),

                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.w, sigmaY: 3.h), 
                          child: Container(
                            height: 350.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: Colors.white.withValues(alpha: 0.3),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white60, Colors.white10],
                              ),
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(
                                width: 2.w,
                                color: Colors.white30,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 50.r,
                                  offset: Offset(
                                    0,
                                    5.h,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Form(
                              key: _formKeyRegister,
                              child: Column(
                                children: [
                                  25.vs,
                                  Text(
                                    "Login Form",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  50.vs,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.h,
                                    ),
                                    child: TextFormField(
                                      controller: _phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],

                                      maxLength: 8,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                      cursorColor: Colors.white,
                                      cursorHeight: 20.h,
                                      decoration: InputDecoration(
                                        counterStyle: TextStyle(
                                          color: Colors
                                              .white, // Change to your desired color
                                          fontSize: 12
                                              .sp, // Optional: change font size
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            right: 10.0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CountryCodePicker(
                                                initialSelection: 'TN',
                                                showFlag: true,
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed:
                                                    false,
                                                alignLeft: false,
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Container(
                                                width: 1,
                                                height: 15.h,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        hintText: "Enter Mobile Number",
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                        errorStyle: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            174,
                                            4,
                                            4,
                                          ), // Change error text color
                                          fontSize: 12.sp, // Change font size
                                          fontWeight: FontWeight.w800,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                              234,
                                              94,
                                              41,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your mobile number';
                                        }
                                        if (value.length < 8) {
                                          return 'Mobile number must be 8 digits';
                                        }
                                        if (!tunisianPhoneNumberRegExp.hasMatch(
                                          value,
                                        )) {
                                          return 'Please enter a valid mobile number';
                                        }
                                        return null;
                                      },
                                     
                                    ),
                                  ),

                                  40.vs,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        FocusScope.of(
                                          context,
                                        ).requestFocus(FocusNode());

                                        // Handle login action

                                        if (_formKeyRegister.currentState!
                                            .validate()) {
                                         
                                        
                                          setState(() {
                                            loading = true;
                                          });
                                          Future.delayed(const Duration(seconds: 2), () {
                                            // Simulate a network request

                                            Fluttertoast.showToast(
                                              msg:
                                                  "OTP sent successfully \n \t code is 1234",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.TOP,
                                              timeInSecForIosWeb: 3,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    255,
                                                    2,
                                                    129,
                                                    40,
                                                  ),
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                            // ignore: use_build_context_synchronously
                                            showOtpBottomSheet(context,);

                                            setState(() {
                                              loading = false;
                                            });
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                          double.infinity,
                                          50.h,
                                        ),
                                        backgroundColor: const Color.fromRGBO(
                                          234,
                                          94,
                                          41,
                                          1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15.h,
                                          horizontal: 20.w,
                                        ),
                                      ),
                                      child: loading
                                          ? Center(
                                              child: SizedBox(
                                                width: 20.w,
                                                height: 20.h,
                                                child:
                                                     CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 3.w,
                                                    ),
                                              ),
                                            )
                                          : Text(
                                              "Send OTP",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),
                                  20.vs,
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/');
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "Don’t have an account?  ",
                                            ),
                                            TextSpan(
                                              text: "Sign up",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                  234,
                                                  94,
                                                  41,
                                                  1,
                                                ),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(54, 0, 0, 0), // Top is semi-dark
                      Color.fromARGB(
                        0,
                        255,
                        255,
                        255,
                      ), // Bottom fades to clear
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








