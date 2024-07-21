// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:reso/data/model/resturant_model.dart';

// class RestaurantRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<Restaurant>> fetchRestaurantsByAdminId(String adminId) {
//     return _firestore
//         .collection('restaurants')
//         .where('adminId', isEqualTo: adminId)
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((doc) => Restaurant.fromJson(doc.data()))
//           .toList();
//     });
//   }

//   final categoryStreamProvider = StreamProvider<List<Restaurant>>((ref) {
//     return FirebaseFirestore.instance
//         .collection('restaurants')
//         .where('adminId', isEqualTo: adminId)
//         .orderBy('category')
//         .snapshots()
//         .map((snapshot) => Restaurant.fromJson(snapshot.docs)).toList());
//   });
// }
