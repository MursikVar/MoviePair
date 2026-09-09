import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/first_screen_image.png',
              height: 300,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 50),
            Text(
              'MoviePair',
              // textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Общий список фильмов для двоих — без споров, что посмотреть',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(156, 163, 178, 1),
                fontWeight: FontWeight.normal,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 55),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/auth'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 107, 107, 1),
                ),
                child: Text(
                  'Начать',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 95),
          ],
        ),
      ),
    );
  }
}
