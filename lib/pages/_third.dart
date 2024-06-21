import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '_call_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key, required this.name, required this.userID});
  final String name;
  final String userID;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.videocam_circle_fill,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Zego',
                      style: GoogleFonts.caesarDressing(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 30),
              Text('Welcome',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey[600])),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${widget.name}!",
                style: GoogleFonts.exo2(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter the room ID below to join the call:",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _roomIDController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[800],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'Enter Room ID',
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                CupertinoIcons.videocam_circle_fill,
                                color: Colors.grey[400],
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[400], fontSize: 16)),
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_roomIDController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CallPage(
                                    callID: _roomIDController.text.toString(),
                                    name: widget.name,
                                    userId: widget.userID,
                                  )));

                      print("Room ID: ${_roomIDController.text}");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: Row(
                            children: [
                              Icon(
                                Icons.warning,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Please enter a room ID to join!',
                                style: GoogleFonts.inter(color: Colors.white),
                              ),
                            ],
                          )));
                    }
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Join Call',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int generateRandom4DigitNumber() {
    Random random = Random();
    // Generate a 12-digit number by ensuring the first digit is non-zero
    int random12DigitNumber = 1000 + random.nextInt(9000);
    return random12DigitNumber;
  }

  final TextEditingController _roomIDController = TextEditingController();
}
