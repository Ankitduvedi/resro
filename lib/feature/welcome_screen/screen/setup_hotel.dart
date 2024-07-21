import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reso/data/model/resturant_model.dart';
import 'package:reso/providers/user_data_provider.dart';

class SetupHotelScreen extends ConsumerStatefulWidget {
  const SetupHotelScreen({super.key});

  @override
  ConsumerState<SetupHotelScreen> createState() => _SetupHotelScreenState();
}

class _SetupHotelScreenState extends ConsumerState<SetupHotelScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Setup Your Hotel',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We are glad to have you here.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black26,
              ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                }
                return null; // Return null if the input is valid
              },
              decoration: InputDecoration(
                labelText: 'Name of hotel',
                labelStyle: GoogleFonts.ptSans(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _nameController,
            ),
            const SizedBox(height: 32),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an Phone number';
                } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null; // Return null if the input is valid
              },
              decoration: InputDecoration(
                labelText: 'Email of Hotel',
                labelStyle: GoogleFonts.ptSans(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _phoneController,
            ),
            const SizedBox(height: 32),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null; // Return null if the input is valid
              },
              decoration: InputDecoration(
                labelText: 'Phone number',
                labelStyle: GoogleFonts.ptSans(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(height: 32),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an address';
                }
                return null; // Return null if the input is valid
              },
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: GoogleFonts.ptSans(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _addressController,
            ),
            const SizedBox(height: 32),
            // Image.asset(
            //   'assets/welcome_image.png', // Add your image in the assets folder
            //   height: 200,
            // ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final Restaurant resturant = Restaurant(
                    image: '',
                    about: '',
                    name: _nameController.text,
                    createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    ownerId: ref.watch(userDataProvider).userData!.id,
                    email: _emailController.text,
                    pushToken: '',
                    seats: 0,
                    phoneNumber: _phoneController.text,
                    address: _addressController.text,
                    designation: '',
                    isApproved: 0,
                    tourPage: '',
                    isNewUser: true);
                FirebaseFirestore.instance
                    .collection('restaurant')
                    .doc(resturant.id)
                    .set(resturant.toJson());
                final userdata = ref.watch(userDataProvider).userData!;
                userdata.isNewUser = false;
                ref.watch(userDataProvider).updateUserData(userdata);
                // Navigate to owner screen
                context.push('/');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
