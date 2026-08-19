import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Color primaryColor = const Color(0xFF8A051C);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue.shade100,
      appBar: _homeAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 275,
                  height: 390,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        primaryColor,
                        BlendMode.multiply,
                      ),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQroZCL6TmdmRCRS6Pg6RbwDATeamekVOxDsR5clHk_SA&s=10',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Bad Guy',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Billie Eilish/ Justin Bieber',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -45,
                  child: SleekCircularSlider(
                    min: 0,
                    max: 4,
                    initialValue: 2,
                    appearance: CircularSliderAppearance(
                      size: 360,
                      counterClockwise: true,
                      startAngle: 150,
                      angleRange: 120,
                      customWidths: CustomSliderWidths(
                        trackWidth: 3,
                        progressBarWidth: 10,
                        shadowWidth: 0,
                      ),
                      customColors: CustomSliderColors(
                        trackColor: Colors.black12,
                        progressBarColor: Colors.black,
                      ),
                      infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: null,
        icon: Icon(Icons.chevron_left, color: Colors.black, size: 35),
      ),
      actions: [
        Transform.rotate(
          angle: (270 / (180 / pi)), //Rotate 270 degrees
          child: IconButton(
            onPressed: null,
            icon: Icon(Icons.bar_chart, color: Colors.black, size: 35),
          ),
        ),
      ],
    );
  }
}
