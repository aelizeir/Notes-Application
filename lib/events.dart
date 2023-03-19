import 'package:application_1/page/event_editing_page.dart';
import 'package:application_1/widget/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventEditingPage())
        ),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black12,
      ),
    );
  }
}
