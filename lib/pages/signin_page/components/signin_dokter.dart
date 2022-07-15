import 'package:dashboard_cageur/pages/signin_page/signin.dart';
import 'package:dashboard_cageur/pages/signup_page/components/signup_dokter.dart';
import 'package:dashboard_cageur/pages/signup_page/signup.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/widget/custom_button.dart';
import 'package:dashboard_cageur/widget/custom_form.dart';
import 'package:dashboard_cageur/widget/custom_form_password.dart';
import 'package:flutter/material.dart';

class SignInDokter extends StatefulWidget {
  const SignInDokter({Key? key}) : super(key: key);

  @override
  State<SignInDokter> createState() => _SignInDokterState();
}

class _SignInDokterState extends State<SignInDokter> {
  final _formKeyDokter = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: ListView(
        children: [
          Form(
            key: _formKeyDokter,
            child: Column(
              children: [
                FormEmailAdmin(emailController: _emailController),
                FormPassDokter(),
                ButtonDokter(formKeyDokter: _formKeyDokter),
                OrContinueDokter(),
                ButtonGoogleDokter(),
                SectionAkunDokter()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class FormEmailAdmin extends StatelessWidget {
  const FormEmailAdmin({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
        hintext: 'Email',
        TextValue: 'Isi Email',
        icon: Icon(
          Icons.mail,
          color: kgreen,
        ),
        KeyboardType: TextInputType.emailAddress,
        controll: _emailController);
  }
}

class ButtonDokter extends StatelessWidget {
  const ButtonDokter({
    Key? key,
    required GlobalKey<FormState> formKeyDokter,
  })  : _formKeyDokter = formKeyDokter,
        super(key: key);

  final GlobalKey<FormState> _formKeyDokter;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        text: 'Login',
        onPressed: () {
          if (_formKeyDokter.currentState!.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInPage()));
          }
        },
        color: kgreen);
  }
}

class SectionAkunDokter extends StatelessWidget {
  const SectionAkunDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mau jadi mitra ',
            style: TextStyle(color: kblue, fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: Text(
              'Daftar ',
              style: TextStyle(
                  color: kgreen, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonGoogleDokter extends StatelessWidget {
  const ButtonGoogleDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CustomButton(text: 'Google', onPressed: () {}, color: korange),
    );
  }
}

class OrContinueDokter extends StatelessWidget {
  const OrContinueDokter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        'Or continue with',
        style: TextStyle(
          color: kgrey,
          fontSize: 15,
        ),
      ),
    );
  }
}

class FormPassDokter extends StatefulWidget {
  const FormPassDokter({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPassDokter> createState() => _FormPassDokterState();
}

class _FormPassDokterState extends State<FormPassDokter> {
  TextEditingController _passController = TextEditingController();
  bool _isHidePassword = true;
  void togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: CustomPassword(
          controll: _passController,
          inputType: TextInputType.visiblePassword,
          hintexts: 'Password',
          icons: Icon(
            Icons.lock,
            color: kgreen,
          ),
          sufIcons: IconButton(
              onPressed: () {
                setState(() {});
                _isHidePassword = !_isHidePassword;
              },
              icon: Icon(
                _isHidePassword ? Icons.visibility_off : Icons.visibility,
                color: _isHidePassword ? kgrey : kgreen,
              )),
          obscure: _isHidePassword,
          validatorText: 'Isi Password'),
    );
  }
}
