import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/src/constance.dart';
import 'package:untitled2/src/model/user_info.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ********  UPDATE USER INFO TO FIREBASE *******
  UpDtatOrder(InfoOrder infoOrder) {
    _firestore.collection(kCollection).add({
      kNameUser: infoOrder.nameUser,
      kPhone: infoOrder.phone,
      kPhoneWhats: infoOrder.whats,
      kAddressUser: infoOrder.address,
      kProductBrand: infoOrder.type,
      kProductImageUrl: infoOrder.image,
      kProductName: infoOrder.nameProduct,
      kProductSize: infoOrder.size
    });
  }
}
