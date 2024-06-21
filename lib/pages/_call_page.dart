import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../constants/_constants.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID, required this.name, required this.userId}) : super(key: key);
  final String callID;
  final String name;
  final String userId;


  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConstants.appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: MyConstants.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: name+123.toString(),
      userName: name,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      // config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
          return user != null
              ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: CupertinoColors.white,
                width: 2,
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2014/04/03/11/47/avatar-312160_1280.png',
                ),
              ),
            ),
          )
              : const SizedBox();
        },
    );
  }
}
