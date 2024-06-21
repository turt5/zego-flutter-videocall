import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '_call_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name, required this.roomId});

  final String name;
  final int roomId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Room ID:",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.roomId}",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: widget.roomId.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.background,

                          content: Row(

                            children: [
                              Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                              const SizedBox(width: 10),
                              Text('Room ID copied to clipboard!',
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.copy,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Share this room ID with the participant you want to connect with & click on the button below to start the call.',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey[600])),
              Expanded(child: Container()),

              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CallPage(
                                callID: widget.roomId.toString(),
                                name: widget.name,
                                userId: widget.name+generateRandom4DigitNumber().toString()))
                    );
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Start Call',
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
}
