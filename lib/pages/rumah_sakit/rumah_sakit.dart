import 'dart:math';

import 'package:dashboard_cageur/pages/dashboard_page/dashboard.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/styles/font_styles.dart';
import 'package:flutter/material.dart';

class OptionRs extends StatelessWidget {
  const OptionRs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> rs = [
      {"images": "assets/images/rsih.png", "rs": "RS. Nurhayati"},
      {"images": "assets/images/rsih.png", "rs": "RS. Nurhayati"},
      {"images": "assets/images/rsih.png", "rs": "RS. Nurhayati"},
      {"images": "assets/images/rsih.png", "rs": "RS. Nurhayati"},
    ];

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                child: Stack(
              children: [
                Image.asset('assets/images/atas.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/department.png',
                            width: 73,
                          ),
                          Text(
                            'Pilih RS / Klinik',
                            style: TitleTexts,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: rs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DashboardPage()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Image.asset(
                                rs[index]["images"],
                                width: 100,
                                height: 78,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(rs[index]["rs"])
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
