import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class HomeScreen extends StatelessWidget {
  final int appID = 1950927253; // Replace with your App ID
  final String appSign =
      "8e8b7a22a9d4b384021ff83104c1d6e9e935685a961f38eee7b23b57d8021c9d"; // Replace with your App Sign



  @override
  Widget build(BuildContext context) {
    // Get the current user's information
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String currentUserEmail = currentUser?.email ?? 'Unknown User';
    final String currentUserID = currentUser?.uid ?? 'Anonymous';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
      ),
      body: Column(
        children: [
          // Display the logged-in user's email at the top in red
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Logged in as: $currentUserEmail',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Divider(), // Add a divider for separation
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No registered users found.'));
                }

                final users = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index].data() as Map<String, dynamic>;
                    final userName = user['name'] ?? 'Unknown';
                    final callID = user['callId'] ?? 'Unknown';

                    return ListTile(
                      title: Text(userName),
                      subtitle: Text('Call ID: $callID'),
                      trailing: ZegoSendCallInvitationButton(
                        isVideoCall: true,
                        resourceID: "Zego_test", // Ensure this matches your Zego Dashboard setup
                        invitees: [
                          ZegoUIKitUser(
                            id: callID,
                            name: userName,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
