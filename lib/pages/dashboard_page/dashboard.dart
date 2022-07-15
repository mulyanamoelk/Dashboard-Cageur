import 'dart:ui';

import 'package:dashboard_cageur/pages/appointment_page/appointment.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/styles/font_styles.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dashboards = [
      {"images": "assets/images/appointment.png", "title": "Appointment"},
      {"images": "assets/images/Schedule.png", "title": "Jadwal"},
      {"images": "assets/images/Clinic.png", "title": "klinik"},
      {"images": "assets/images/department.png", "title": "Department"},
      {"images": "assets/images/Notification.png", "title": "Notification"},
      {"images": "assets/images/Users.png", "title": "Users"},
      {"images": "assets/images/Patient.png", "title": "Patient"},
      {"images": "assets/images/Gallery.png", "title": "Gallery"},
      {"images": "assets/images/Ads.png", "title": "Banner"},
      {"images": "assets/images/Setting.png", "title": "Setting"},
    ];
    return Scaffold(
      body: Container(
        child: Column(
          children: [
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
                              child: Image.asset('assets/images/doctor.png')),
                          Text(
                            'Admin App',
                            style: TitleTexts,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: dashboards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AppointmentPage()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Image.asset(
                                  dashboards[index]["images"],
                                  width: 100,
                                  height: 78,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(dashboards[index]["title"])
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
