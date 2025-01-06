// import 'package:flutter/material.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
//
// class VoiceCallScreen extends StatefulWidget {
//
//
//   const VoiceCallScreen({super.key,required this.callid});
//   final String callid;
//
//
//   @override
//   State<VoiceCallScreen> createState() => _VoiceCallScreenState();
// }
//
// class _VoiceCallScreenState extends State<VoiceCallScreen> {
//   final String appID = '1950927253'; // Replace with your App ID
//   final String appSign = "8e8b7a22a9d4b384021ff83104c1d6e9e935685a961f38eee7b23b57d8021c9d";
//   final String userID = "user_${DateTime.now().millisecondsSinceEpoch}"; // Generate unique userID
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Zego Voice Call'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ZegoUIKitPrebuiltCall(
//                   appID: int.parse(appID),
//                   appSign: appSign,
//                   userID: userID,
//                   userName: "User $userID",
//                   callID: widget.callid,
//                   config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
//                 ),
//               ),
//             );
//           },
//           child: const Text('Start Voice Call'),
//         ),
//       ),
//     );
//   }
// }