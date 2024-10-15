

import 'package:amazon_stabrak/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireStore{

 static final auth = FirebaseAuth.instance;

   static Future <void>add( String name,String age,String phonenumber) async{
    await FirebaseFirestore .instance.collection('Users').add({
      'username':name,
      'age':age,
      'phonenumber':phonenumber
    });
    print('Added');
  }

  static Future<void> AddUserInfo(String name,String age,String phonenumber) async{
     await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).set({
       'username':name,
       'age':age,
       'phonenumber':phonenumber
     });
     print('Added');
  }

 static Future<UserModel> GetUserInfo() async{
   await FirebaseFirestore.instance
       .collection('Users')
       .doc(auth.currentUser!.uid).get().then ((snapshot) {
       if(snapshot.exists){
         UserModel user=UserModel(
             name: snapshot.data()!['username'],
             age: snapshot.data()!['age'],
             phonenumber: snapshot.data()!['phonenumber'],);
         return user;

       }else{
         print('No data');
         return UserModel();

       }
   });
   return UserModel();
   }

 static Future<void> AddToWishList(String name, String des, int price,
     int oldprice, String img1, String img2, String img3) async {
     await FirebaseFirestore.instance
       .collection('Users')
       .doc(auth.currentUser!.uid)
       .collection('wishlist')
       .add({
     'name': name,
     'des': des,
     'price': price,
     'oldprice': oldprice,
     'img1': img1,
     'img2': img2,
     'img3': img3,
   });
 }


 static Future<void> AddOrder(String fullname, String location, String address,String phonenumber, int totalprice,String order ) async {
   await FirebaseFirestore.instance
       .collection('Users')
       .doc(auth.currentUser!.uid)
       .collection('Orders')
       .add({
     'fullname': fullname,
     'location': location,
     'address': address,
     'phonenumber': phonenumber,
     'totalprice': totalprice,
     'order': order,

   });
 }







}

