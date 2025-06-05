import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:heavyfreight/core/extensions/spacing.dart';
import 'package:heavyfreight/core/widgets/custom_appbar.dart';
import 'package:heavyfreight/features/Package/view/wigets/card_widget.dart';

class PackageForm extends StatefulWidget {
  const PackageForm({super.key});

  @override
  State<PackageForm> createState() => _PackageFormState();
}

class _PackageFormState extends State<PackageForm> {
  final _pUAddressController = TextEditingController();
  final _dFAddressController = TextEditingController();
  bool loading = false; // Track loading state
  final _formKeyRegister = GlobalKey<FormState>();
  int selectedPackIndex = -1;
  int selectedCardIndex = -1; // Track selected card index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "New Delivery",
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg_image.avif"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Container(
              color: const Color.fromARGB(
                144,
                0,
                0,
                0,
              ), // adjust opacity to control darkness
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKeyRegister,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row 1: Green Circle + "From"
                          Row(
                            children: [
                              _buildCircle(
                                15,
                                const Color.fromRGBO(106, 153, 78, 1),
                              ),
                              10.hs,
                              Text(
                                "From",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 65, 67, 69),
                                ),
                              ),
                            ],
                          ),
                          2.vs,

                          // Row 2: Grey circle + address + svg icon
                          Row(
                            children: [
                              2.hs,
                              _buildCircle(
                                10,
                                const Color.fromRGBO(173, 181, 189, 1),
                              ),
                              10.hs,
                              Expanded(
                                child: _buildAddressField(
                                  "Gabes 6011, Cite Zouhour",
                                  "Please enter pickup address",
                                  _pUAddressController,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                 Navigator.pushNamed(
                                    context,
                                    '/delivery_info',
                                    
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/map_icon.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          2.vs,

                          // Row 3: Grey circle + horizontal line
                          Row(
                            children: [
                              2.hs,
                              _buildCircle(
                                10,
                                const Color.fromRGBO(173, 181, 189, 1),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Divider(
                                  color: const Color.fromRGBO(173, 181, 189, 1),
                                  thickness: 1.h,
                                ),
                              ),
                            ],
                          ),
                          2.vs,

                          // Row 4: Grey circle + "To"
                          Row(
                            children: [
                              2.hs,
                              _buildCircle(
                                10,
                                const Color.fromRGBO(173, 181, 189, 1),
                              ),
                              10.hs,
                              Text(
                                "To",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 65, 67, 69),
                                ),
                              ),
                            ],
                          ),
                          2.vs,

                          // Row 5: Yellow circle + destination + svg
                          Row(
                            children: [
                              _buildCircle(
                                15,
                                const Color.fromRGBO(253, 163, 16, 1),
                              ),
                              10.hs,

                              Expanded(
                                child: _buildAddressField(
                                  "Tunis 4021, Cite Olympique",
                                  "Please enter drop-off address",
                                  _dFAddressController,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                
                                  Navigator.pushNamed(
                                    context,
                                    '/delivery_info',
                                    
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/map_icon.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.vs,
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Package Size",

                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    18.vs,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeightCard(
                          weight: "< 5 Kg",
                          size: "Small",
                          svgURL: "small.svg",
                          isSelected: selectedCardIndex == 0,
                          width: 45.w,
                          height: 45.h,
                          onTap: () {
                            setState(() {
                              selectedCardIndex = 0;
                            });
                          },
                        ),
                        WeightCard(
                          weight: "5 - 20 Kg",
                          size: "Medium",
                          svgURL: "medium.svg",
                          isSelected: selectedCardIndex == 1,
                          width: 60.w,
                          height: 60.h,
                          onTap: () {
                            setState(() {
                              selectedCardIndex = 1;
                            });
                          },
                        ),
                        WeightCard(
                          weight: "> 20 Kg",
                          size: "Large",
                          svgURL: "large.svg",
                          isSelected: selectedCardIndex == 2,
                          width: 70.w,
                          height: 70.h,
                          onTap: () {
                            setState(() {
                              selectedCardIndex = 2;
                            });
                          },
                        ),
                      ],
                    ),
                    10.vs,
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Delivery Packs",

                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),

                    DeliveryOptionSelector(
                      onSelected: (index) {
                        setState(() {
                          selectedPackIndex = index;
                        });
                       
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ElevatedButton(
                        onPressed: () {
                          // print("Selected Pack option: $selectedPackIndex");
                          // print("Selected Size option: $selectedCardIndex");
                          if (_formKeyRegister.currentState!.validate() &&
                              selectedPackIndex != -1 &&
                              selectedCardIndex != -1) {
                            setState(() {
                              setState(() {
                                loading = true;
                              });
                            });
                            // Simulate a network call or processing
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                loading = false;
                              });
                            });

                            // Proceed with the next step
                            Navigator.pushNamed(context, '/track_delivery',
                               );
                          } else if (_formKeyRegister.currentState!
                                  .validate() &&
                              (selectedPackIndex == -1 ||
                                  selectedCardIndex == -1)) {
                            // Show error message or handle validation
                            Fluttertoast.showToast(
                              msg:
                                  "Please select a package size and delivery pack",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 3,
                              backgroundColor: const Color.fromARGB(
                                255,
                                174,
                                4,
                                4,
                              ),
                              textColor: Colors.white,
                              fontSize: 16.0,
                              
                              
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 30.h),
                          backgroundColor: const Color.fromRGBO(234, 94, 41, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 20.w,
                          ),
                        ),
                        child: loading
                            ? SizedBox(
                                height: 18.h,
                                width: 18.h,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.w,
                                ),
                              )
                            : Text(
                                "Continue",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ),
                    ),

                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryOptionSelector extends StatefulWidget {
  final Function(int selectedPackIndex) onSelected;

  const DeliveryOptionSelector({super.key, required this.onSelected});

  @override
  State<DeliveryOptionSelector> createState() => _DeliveryOptionSelectorState();
}

class _DeliveryOptionSelectorState extends State<DeliveryOptionSelector> {
  int selectedPackIndex = -1;

  Widget _buildOption({
    required int index,
    required String title,
    required String subtitle,
    required String price,
  }) {
    bool isSelected = selectedPackIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPackIndex = index;
        });
        widget.onSelected(selectedPackIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 30.w),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? const Color.fromRGBO(234, 94, 41, 1)
                : Colors.transparent,
            width: 3.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 65, 67, 69),
                  ),
                ),
              ],
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(10, 132, 9, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.vs,
        _buildOption(
          index: 0,
          title: "Standard",
          subtitle: "2-3 Days shipping",
          price: "23 DT",
        ),
        10.vs,
        _buildOption(
          index: 1,
          title: "Fast",
          subtitle: "1 Day shipping",
          price: "32 DT",
        ),
        25.vs,
      ],
    );
  }
}

Widget _buildCircle(double size, Color color) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

Widget _buildAddressField(
  String hintText,
  String errorText,
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
    decoration: InputDecoration(
      enabledBorder: InputBorder.none, // No underline when not focused
      focusedBorder: InputBorder.none, // No underline when focused
      errorBorder: InputBorder.none, // No underline on error
      focusedErrorBorder: InputBorder.none,
      isDense: true, // Reduces height
      contentPadding: EdgeInsets.symmetric(
        vertical: 0.h,
        horizontal: 0.w,
      ), // Tight padding
      hintText: hintText,

      hintStyle: TextStyle(
        fontSize: 15.sp,
        color: const Color.fromARGB(255, 65, 67, 69),
      ),
      errorStyle: TextStyle(
        color: const Color.fromARGB(255, 174, 4, 4),
        fontSize: 12.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorText;
      }
      if (value.length < 8) {
        return 'Please enter a valid address';
      }
      return null;
    },
  );
}

//TODO move this to a separate file

