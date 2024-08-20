// user_profile_screen.dart
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with user's profile image URL
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "John Doe", // Replace with user's name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "johndoe@example.com", // Replace with user's email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blueAccent),
              title: Text('Account Settings'),
              onTap: () {
                // Handle account settings navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.blueAccent),
              title: Text('Help & Support'),
              onTap: () {
                // Handle help & support navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blueAccent),
              title: Text('Logout'),
              onTap: () {
                // Handle logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
