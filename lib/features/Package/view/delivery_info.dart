import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heavyfreight/core/extensions/spacing.dart';
import 'package:heavyfreight/core/widgets/custom_appbar.dart';

class DeliveryInfo extends StatefulWidget {
  const DeliveryInfo({super.key});

  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  final _formKeyRegister = GlobalKey<FormState>();
  bool switchValue = false;
   final addressController = TextEditingController();
  final  senderController = TextEditingController();
  final  phoneController = TextEditingController();
   void _toggleSwitch(bool value) {
    setState(() {
      switchValue = value;

      if (switchValue) {
        // Set default values when turned ON
        addressController.text = "Tunis 30, Rue de la République";
        senderController.text = "william smith";
        phoneController.text = "21622345789";
      } else {
        // Clear all values when turned OFF
        addressController.clear();
        senderController.clear();
        phoneController.clear();
      }
    });
  }

  @override
  void dispose() {
    addressController.dispose();  
    senderController.dispose(); 
    phoneController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Delivery Information"),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.vs,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.asset(
                        'assets/location.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 260.0.h,
                      ),
                    ),
                    Positioned(
                      bottom: 15.h,
                      right: 10.w,
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2.w, 2.h),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.my_location,
                            size: 25.sp,
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(255, 228, 78, 8),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.vs,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKeyRegister,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          labelStyle: TextStyle(fontSize: 14.sp),
                          isDense: true,
                          hintText: 'Search Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(233, 236, 239, 1),
                          suffixIcon: Icon(Icons.search, color: Colors.black, size: 22.sp),
                        ),
                      ),
                      5.vs,
                      Divider(
                        color: Colors.grey, // Line color
                        thickness: 1.0, // Line thickness
                        indent: 20.w, // Left padding
                        endIndent: 20.w, // Right padding
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add me as recipient',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          CupertinoSwitch(
                            activeTrackColor: const Color.fromRGBO(234, 94, 41, 1),
                            thumbColor: Colors.white,
                           
                            value: switchValue,
                             onChanged: _toggleSwitch,
                          ),
                        ],
                      ),
                      6.vs,
                      
                       
                        TextFormField(
                          controller: addressController,
                          validator: (value) => value!.isEmpty ? 'Please enter an address' : null,
                          keyboardType: TextInputType.streetAddress,
                          
                          decoration: InputDecoration(
                            
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 16.w,
                            ),
                            labelStyle: TextStyle(fontSize: 14.sp),
                            isDense: true,
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(233, 236, 239, 1),
                            prefixIcon: Icon(Icons.pin_drop_rounded, color: Colors.black, size: 22.sp),
                          ),
                        ),
                      
                        6.vs,
                        TextFormField(
                        validator: (value) => value!.isEmpty ? 'Please enter sender name' : null,
                        keyboardType: TextInputType.name,
                        maxLength: 30,
                        
                        controller: senderController,
                        decoration: InputDecoration(
                          counterText: '',
                          
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          labelStyle: TextStyle(fontSize: 14.sp),
                          isDense: true,
                          hintText: 'Sender Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(233, 236, 239, 1),
                          prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.black, size: 22.sp),
                        ),
                      ),
                      6.vs,
                      TextFormField(
                        controller: phoneController,
                        validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          labelStyle: TextStyle(fontSize: 14.sp),
                          isDense: true,
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(233, 236, 239, 1),
                          prefixIcon: Icon(Icons.phone, color: Colors.black, size: 22.sp),
                        ),
                      ),
                    ],
                  ),
                ),
            
              ),
              10.vs,
              ElevatedButton(
                onPressed: () { 
                  if (_formKeyRegister.currentState!.validate()) {
                    // Handle form submission
                    Navigator.pushNamed(context, '/package_form');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(234, 94, 41, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 30.w),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w600),
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
