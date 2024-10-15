import 'package:amazon_stabrak/Navigation%20bar/Navi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Blogic/Firebase/Auth.dart';
import 'Home screen.dart';
import 'SignUp screen.dart';
import 'Themes/AppColors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? Key}) : super(key: Key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  String? email;
  String? password;

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
                "Log Into",
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
                "Your Account",
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
              onChanged: (value) {
                email = value;
              },
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
              onChanged: (value) {
                password = value;
              },
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
                Authentication.Login(
                    emailcontroller.text.trim(), passcontroller.text.trim());
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Navi()));
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              width: 260.w,
              height: 40.h,
              child: Center(
                  child: Text(
                "SignIn",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
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
            onTap: () {
              try {
                if (email == null || password == null) {
                  setState(() {
                    const SnackBar(
                        content: Text("Please Enter Your Email And Password"));
                  });
                } else {
                  Authentication.Login(
                      emailcontroller.text.trim(), passcontroller.text.trim());
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Navi()));
                }
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              width: 260.w,
              height: 40.h,
              child: Center(
                  child: Text(
                "SignIn With Google",
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
              SizedBox(width: 50.w),
              Text(
                "Don't have an Account Yet?",
                style:
                    TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp),
              ),
              SizedBox(width: 5.w),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "SignUp",
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
