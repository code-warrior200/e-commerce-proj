// lib/Screens/UserProfileScreen.dart
import 'package:flutter/material.dart';
class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with actual user profile image URL
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'John Doe', // Replace with actual user name
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'johndoe@example.com', // Replace with actual user email
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Divider(thickness: 1, color: Colors.grey[300]),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blueAccent),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  // Add edit profile functionality
                },
              ),
              Divider(thickness: 1, color: Colors.grey[300]),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.blueAccent),
                title: Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  // Add change password functionality
                },
              ),
              Divider(thickness: 1, color: Colors.grey[300]),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.blueAccent),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  // Add logout functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
