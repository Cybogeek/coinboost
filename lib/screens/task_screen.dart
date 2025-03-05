import 'package:coinboost/screens/task_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_navigation.dart';

class TaskScreen extends StatelessWidget {
  final String taskName;
  final String taskImage;

  const TaskScreen({
    super.key,
    required this.taskName,
    required this.taskImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          taskName,
          style: GoogleFonts.robotoMono(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Task Image
            Image.asset(taskImage, width: 350),
            SizedBox(height: 20),

            // Rules of Task
            Text(
              'Rules of Task',
              style: GoogleFonts.robotoMono(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Keep scrolling for 10 minutes.',
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.black),
                ),
                Text(
                  '2. Keep clicking every 30 seconds.',
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.black),
                ),
                Text(
                  '3. Don\'t leave the screen for more than 30 seconds.',
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.black),
                ),
              ],
            ),

            // Start Task Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the relevant gameplay or news page

                // Navigate to News Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return TaskShowPage(
                        taskType: taskName == 'Read News' ? 'news' : 'game',
                        taskImage: taskImage,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF7931A),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Start Task',
                style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(identifier: 1),
    );
  }
}
