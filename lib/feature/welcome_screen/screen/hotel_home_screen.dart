import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reso/data/model/resturant_model.dart';
import 'package:reso/providers/user_data_provider.dart';

class HotelScreen extends ConsumerStatefulWidget {
  const HotelScreen({super.key});

  @override
  ConsumerState<HotelScreen> createState() => HotelScreenState();
}

class HotelScreenState extends ConsumerState<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userDataProvider).userData!;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('restaurant')
            .where('ownerId', isEqualTo: user.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }
          final restaurants = snapshot.data!.docs;
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              log('length ${restaurants.length}');
              final Restaurant restaurant =
                  Restaurant.fromJson(restaurants[index].data());
              return ListTile(
                leading: Text(
                  restaurant.name,
                  style: TextStyle(color: Colors.amber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
