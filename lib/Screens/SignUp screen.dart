import 'package:amazon_stabrak/Blogic/Firebase/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Profile SignUp.dart';
import 'SignIn screen.dart';
import 'Themes/AppColors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? Key}) : super(key: Key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // solve for overflow
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ))
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Create",
                style: GoogleFonts.anton(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                "Account",
                style: GoogleFonts.anton(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                labelText: "Your Email",
                labelStyle: TextStyle(color: AppColors.secondaryColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.secondaryColor)),
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.secondaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                    weight: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: passcontroller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                labelText: "Your Password",
                labelStyle: TextStyle(color: AppColors.secondaryColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.secondaryColor)),
                prefixIcon: Icon(
                  Icons.password,
                  color: AppColors.secondaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {
              try {
                Authentication.createUser(
                    emailcontroller.text.trim(), passcontroller.text.trim());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileSignUp()));
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              width: 260.w,
              height: 40.h,
              child: Center(
                  child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              )),
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(width: 3.h, color: AppColors.secondaryColor)),
            ),
          ).animate().fade(duration: 2.seconds),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 260.w,
              height: 40.h,
              child: Center(
                  child: Text(
                "SignUP With Google",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18.sp,
                ),
              )),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(width: 3.h, color: AppColors.secondaryColor)),
            ),
          ).animate().fade(duration: 2.seconds),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(width: 55.w),
              Text(
                "Already have an account?",
                style:
                    TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
              ),
              SizedBox(width: 5.w),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                        color: AppColors.quaternaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
