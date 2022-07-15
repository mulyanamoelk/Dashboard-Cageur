import 'package:flutter/material.dart';

import '../../../styles/consts.dart';
import '../../../styles/font_styles.dart';

class TitleSignInPage extends StatelessWidget {
  const TitleSignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/doctor.png',
              width: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Admin App',
              style: TitleTexts,
            ),
            Text(
              'Please enter your account here',
              style: TextStyle(color: kgrey, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
