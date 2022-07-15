import 'package:dashboard_cageur/styles/font_styles.dart';
import 'package:flutter/material.dart';

import '../../styles/consts.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/atas.png'),
                  Container(
                    child: Stack(
                      children: [
                        Container(child: Image.asset('assets/images/atas.png')),
                        Container(
                          margin: EdgeInsets.only(top: 35),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: kwhite,
                                    radius: 50,
                                    child: Image.asset(
                                        'assets/images/appointment.png')),
                                Text(
                                  'Appointment',
                                  style: TitleTexts,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kgreen, width: 1),
                        borderRadius: BorderRadius.circular(17)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kgrey, width: 1),
                        borderRadius: BorderRadius.circular(17)),
                    hintText: 'Search Name',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: kgreen,
                        ))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
