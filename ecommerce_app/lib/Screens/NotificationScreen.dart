// notification_screen.dart
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List of notifications (could be fetched from a server or local storage)
  List<Map<String, String>> _notifications = [
    {'title': 'Order Confirmation', 'subtitle': 'Your order has been confirmed.'},
    {'title': 'Discount Offer', 'subtitle': 'Get 20% off on your next purchase.'},
    // Add more notifications here
  ];

  void _clearNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text('Notifications'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: _clearNotifications,
            tooltip: 'Clear All Notifications',
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(child: Text('No notifications available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blueAccent),
                  title: Text(notification['title'] ?? ''),
                  subtitle: Text(notification['subtitle'] ?? ''),
                  // trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            ),
    );
  }
}
