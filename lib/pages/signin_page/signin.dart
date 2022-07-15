import 'package:dashboard_cageur/pages/signin_page/components/signin_dokter.dart';
import 'package:dashboard_cageur/pages/signin_page/components/singin_admin.dart';
import 'package:dashboard_cageur/pages/signin_page/components/title_signin.dart';
import 'package:dashboard_cageur/pages/splash/splash.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/styles/font_styles.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    tabController.dispose();
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
              margin: EdgeInsets.only(left: 45, right: 45, top: 10),
              decoration: BoxDecoration(
                  color: kgrey, borderRadius: BorderRadius.circular(32)),
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      unselectedLabelColor: kblue,
                      labelStyle:
                          TextStyle(color: kwhite, fontWeight: FontWeight.bold),
                      indicatorWeight: 2,
                      controller: tabController,
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
                        )
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: TabBarView(
              children: [SignInAdmin(), SignInDokter()],
              controller: tabController,
            ))
          ],
        ),
      ),
    );
  }
}
