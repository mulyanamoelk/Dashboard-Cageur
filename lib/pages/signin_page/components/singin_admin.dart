import 'package:dashboard_cageur/pages/rumah_sakit/rumah_sakit.dart';
import 'package:dashboard_cageur/pages/signin_page/signin.dart';
import 'package:dashboard_cageur/pages/signup_page/signup.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/widget/custom_button.dart';
import 'package:dashboard_cageur/widget/custom_form.dart';
import 'package:dashboard_cageur/widget/custom_form_password.dart';
import 'package:flutter/material.dart';

class SignInAdmin extends StatefulWidget {
  const SignInAdmin({Key? key}) : super(key: key);

  @override
  State<SignInAdmin> createState() => _SignInAdminState();
}

class _SignInAdminState extends State<SignInAdmin> {
  final _formKeyAdmin = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Form(
            key: _formKeyAdmin,
            child: Column(
              children: [
                FormEmailAdmin(emailController: _emailController),
                FormPassAdmin(),
                ButtonAdmin(formKeyAdmin: _formKeyAdmin),
                OrContinue(),
                ButtonGoogleAdmin(),
                SectionAkunAdmin()
              ],
            ),
          ),
        ),
      ),
    );
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

class SectionAkunAdmin extends StatelessWidget {
  const SectionAkunAdmin({
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

class ButtonGoogleAdmin extends StatelessWidget {
  const ButtonGoogleAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomButton(text: 'Google', onPressed: () {}, color: korange),
    );
  }
}

class OrContinue extends StatelessWidget {
  const OrContinue({
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

class ButtonAdmin extends StatelessWidget {
  const ButtonAdmin({
    Key? key,
    required GlobalKey<FormState> formKeyAdmin,
  })  : _formKeyAdmin = formKeyAdmin,
        super(key: key);

  final GlobalKey<FormState> _formKeyAdmin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: CustomButton(
          text: 'Login',
          color: kgreen,
          onPressed: () {
            if (_formKeyAdmin.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OptionRs()));
            }
          }),
    );
  }
}

//form password
class FormPassAdmin extends StatefulWidget {
  const FormPassAdmin({Key? key}) : super(key: key);

  @override
  State<FormPassAdmin> createState() => _FormPassAdminState();
}

class _FormPassAdminState extends State<FormPassAdmin> {
  bool _isHidePassword = true;
  final TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _passController.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPassword(
        controll: _passController,
        inputType: TextInputType.visiblePassword,
        hintexts: 'Password',
        icons: Icon(
          Icons.lock,
          color: kgreen,
        ),
        sufIcons: IconButton(
            onPressed: () {
              setState(() {
                _isHidePassword = !_isHidePassword;
              });
            },
            icon: Icon(
              _isHidePassword ? Icons.visibility_off : Icons.visibility,
              color: _isHidePassword ? kgrey : kgreen,
            )),
        obscure: _isHidePassword,
        validatorText: 'Isi Password');
  }
}
