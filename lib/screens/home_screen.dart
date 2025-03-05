import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard_screen.dart'; // For custom fonts

class HomeScreen extends StatelessWidget {
  final _mobileController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  Image.asset(
                    'assets/images/LOGO.png', // Replace with your logo path
                    width: 200,
                  ),
                  SizedBox(height: 20),

                  // Another Image
                  Image.asset(
                    'assets/images/savings1.png', // Replace with your image path
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 20),

                  // Mobile Number Input
                  TextField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Mobile Number',
                      labelStyle: GoogleFonts.robotoMono(
                        fontSize: 16,
                        color: const Color.fromARGB(80, 0, 0, 0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 222, 222, 222),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),

                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle continue button press
                      String mobileNumber = _mobileController.text;
                      print('Mobile Number: $mobileNumber');
                      if (mobileNumber.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter a valid mobile number'),
                          ),
                        );
                        return;
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF7931A), // Button color
                      minimumSize: Size(double.infinity, 50), // Full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.robotoMono(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
