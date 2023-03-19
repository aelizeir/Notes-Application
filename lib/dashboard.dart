import 'package:application_1/events.dart';
import 'package:application_1/page/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          const SizedBox(height: 110),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello, Ali!", style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    ),),
                    const SizedBox(height: 4),
                    Text("Dashboard", style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        )
                    ),),
                ],
              ),
            ],
          ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const EventsPage())
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.asset("assets/calendar.png", width: 64,),
                                const SizedBox(height: 10),
                                const Text('Calendar', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const TodoPage())
                          ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.asset("assets/post-it.png", width: 64,),
                                const SizedBox(height: 10),
                                const Text('Notes', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
