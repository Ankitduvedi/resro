import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupHotelScreen extends ConsumerStatefulWidget {
  const SetupHotelScreen({super.key});

  @override
  ConsumerState<SetupHotelScreen> createState() => _SetupHotelScreenState();
}

class _SetupHotelScreenState extends ConsumerState<SetupHotelScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Setup Your Hotel',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We are glad to have you here.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email address';
                } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null; // Return null if the input is valid
              },
              decoration: InputDecoration(
                labelText: 'Enter Email',
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
            // Image.asset(
            //   'assets/welcome_image.png', // Add your image in the assets folder
            //   height: 200,
            // ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to owner screen
                context.push('/loginScreen');
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
                'Continue as Owner',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to staff screen
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
                'Continue as Staff',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
