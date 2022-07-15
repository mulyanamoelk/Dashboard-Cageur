import 'package:dashboard_cageur/pages/signin_page/components/title_signin.dart';
import 'package:dashboard_cageur/pages/signup_page/components/signup_dokter.dart';
import 'package:flutter/material.dart';

import '../../styles/consts.dart';
import '../signin_page/components/signin_dokter.dart';
import '../signin_page/components/singin_admin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllerDokter;
  @override
  void initState() {
    _tabControllerDokter = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabControllerDokter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TitleSignInPage(),
            Container(
              width: 220,
              decoration: BoxDecoration(
                  color: kgrey, borderRadius: BorderRadius.circular(32)),
              child: Column(
                children: [
                  TabBar(
                      labelStyle:
                          TextStyle(color: kwhite, fontWeight: FontWeight.bold),
                      indicatorWeight: 2,
                      controller: _tabControllerDokter,
                      indicatorColor: kgrey,
                      indicator: BoxDecoration(
                          color: kgreen,
                          borderRadius: BorderRadius.circular(32)),
                      labelColor: kwhite,
                      tabs: [
                        Tab(
                          text: 'Admin',
                        ),
                        Tab(
                          text: 'Dokter',
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: TabBarView(
              children: [SignUpDokter(), SignUpDokter()],
              controller: _tabControllerDokter,
            ))
          ],
        ),
      ),
    );
  }
}
