import 'package:flutter/material.dart';

class WeatherAppAbout extends StatefulWidget {
  @override
  _WeatherAppAboutState createState() => _WeatherAppAboutState();
}

class _WeatherAppAboutState extends State<WeatherAppAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE2EBFF),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Text(
          'О разработчике',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFE2EBFF)),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      "Weather app",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE2EBFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                spreadRadius: 12.0,
                                blurRadius: 12.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "by ITMO University",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    Text(
                                      "Версия 123234353452346",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w800,
                                        color: Color(0xFF4A4A4A)
                                      ),
                                    ),
                                    Text(
                                      "от нефиг делать",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF4A4A4A)
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "2021+",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4A4A4A)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
