import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '_second.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'asset/images/woman.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.background.withOpacity(0.7),
              Theme.of(context).colorScheme.background
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
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
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Text(
                  "Let's\nConnect",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Connect with your friends and family\nand more from anywhere across the globe.",
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try{
                        Map<Permission, PermissionStatus> statuses = await [
                          // Permission.accessWifiState,
                          Permission.microphone,
                          // Permission.internet,
                          Permission.camera,
                          Permission.bluetooth,
                          // Permission.modifyAudioSettings,
                          Permission.storage,
                          Permission.phone,
                          // Permission.wakeLock,
                          // Permission.vibration,
                          // Permission.notificationPolicy,
                          Permission.systemAlertWindow,
                          // Permission.foregroundService,
                        ].request();

                        bool anyPermissionDenied = statuses.values.any((status) => status.isDenied || status.isPermanentlyDenied);

                        if (anyPermissionDenied) {
                          // Show a dialog or snackbar to inform the user
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Permissions Denied'),
                              content: Text('Some permissions were denied. Please grant all permissions for the app to function correctly.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }catch(e){
                        print(e);
                      }finally{
                        try {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool("isFirstTime", false);
                        } catch (e) {
                          print(e);
                        } finally {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage()));
                        }
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
                      'Get Started',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
