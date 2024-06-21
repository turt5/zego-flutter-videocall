import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '_home.dart';
import '_third.dart';



class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _nameController = TextEditingController();
  // final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ch1 = MediaQuery.of(context).size.height * 0.2;
    var ch2 = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset:
          true, // Ensure the view resizes when the keyboard appears
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: isKeyboardOpen() ? ch2 : ch1,
              ),
              Text(
                  'To get started, enter your name & click on the button below. Please note that this name will be visible to other participants. After entering your name, you will be given a randomly generated room code to share with other participants to join. Please share the room code with the person you want to connect with.',
                  style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.5), fontSize: 14)),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _nameController,
                // focusNode: _focusNode, // Attach the focus node
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[900],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity / 2,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_nameController.text.isNotEmpty) {
              //         Navigator.of(context).push(
              //           CupertinoPageRoute(
              //             builder: (context) => HomePage(
              //               name: _nameController.text.trim(),
              //               roomId: generateRandom9DigitNumber(),
              //             ),
              //           ),
              //         );
              //       } else {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(
              //             duration: const Duration(seconds: 1),
              //             content: Row(
              //               children: [
              //                 Icon(Icons.warning),
              //                 const SizedBox(width: 10),
              //                 Text('Name Cannot be empty!',
              //                     style: GoogleFonts.inter(
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.white)),
              //               ],
              //             ),
              //             backgroundColor: Theme.of(context).colorScheme.error,
              //           ),
              //         );
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Theme.of(context).colorScheme.primary,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 15),
              //       child: Text('Create Room',
              //           style: GoogleFonts.inter(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //               fontSize: 16)),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                width: double.infinity / 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => ThirdPage(
                            name: _nameController.text.trim(),
                            userID: _nameController.text.trim() +
                                generateRandom9DigitNumber().toString(),
                          )
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Row(
                            children: [
                              Icon(Icons.warning),
                              const SizedBox(width: 10),
                              Text('Name Cannot be empty!',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Join Room',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isKeyboardOpen() {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  int generateRandom9DigitNumber() {
    Random random = Random();
    // Generate a 12-digit number by ensuring the first digit is non-zero
    int random12DigitNumber = 100000000 + random.nextInt(900000000);
    return random12DigitNumber;
  }
}
