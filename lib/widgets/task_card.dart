import 'package:coinboost/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.reward,
  });
  final String imagePath;
  final String title;
  final String reward;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => TaskScreen(taskName: title, taskImage: imagePath),
          ),
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(200),
              border: Border.all(color: Color.fromARGB(20, 48, 0, 80)),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  reward,
                  style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
