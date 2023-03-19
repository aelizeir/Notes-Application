import 'package:application_1/dashboard.dart';
import 'package:application_1/events.dart';
import 'package:application_1/my_drawer_header.dart';
import 'package:application_1/notes.dart';
import 'package:application_1/notifcations.dart';
import 'package:application_1/page/todo_page.dart';
import 'package:application_1/privacy_policy.dart';
import 'package:application_1/profile.dart';
import 'package:application_1/send_feedback.dart';
import 'package:application_1/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.profile) {
      container = ProfilePage();
    } else if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = TodoPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: const Text(
        //   'WorkPlace',
        //   style: TextStyle(
        //       color: Colors.black),
        // ),
        // iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                myDrawerList(),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Profile", Icons.account_circle, currentPage == DrawerSections.profile ? true : false),
          menuItem(2, "Dashboard", Icons.dashboard_outlined, currentPage == DrawerSections.dashboard ? true : false),
          menuItem(3, "Events", Icons.event, currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes, currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined, currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined, currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy Policy", Icons.privacy_tip, currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send Feedback", Icons.feedback_outlined, currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.blueGrey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.profile;
            } else if (id == 2) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white70,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  profile,
  dashboard,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
