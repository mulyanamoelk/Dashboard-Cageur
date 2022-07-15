import 'package:dashboard_cageur/pages/signin_page/components/singin_admin.dart';
import 'package:dashboard_cageur/pages/signin_page/signin.dart';
import 'package:dashboard_cageur/styles/consts.dart';
import 'package:dashboard_cageur/widget/custom_button.dart';
import 'package:dashboard_cageur/widget/custom_form.dart';
import 'package:dashboard_cageur/widget/custom_form_password.dart';
import 'package:flutter/material.dart';

class SignUpDokter extends StatefulWidget {
  const SignUpDokter({Key? key}) : super(key: key);

  @override
  State<SignUpDokter> createState() => _SignUpDokterState();
}

class _SignUpDokterState extends State<SignUpDokter> {
  final _formkeySignUpDokter = GlobalKey<FormState>();
  final TextEditingController _instansiController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _trypassController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _instansiController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passController.dispose();
    _trypassController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Form(
              key: _formkeySignUpDokter,
              child: Column(
                children: [
                  FormInstansiAdmin(instansiController: _instansiController),
                  FormPhoneSignUpAdmin(phoneController: _phoneController),
                  FormEmailSignUpAdmin(emailController: _emailController),
                  FormPassSignUpAdmin(passController: _passController),
                  FormAlamatAdmin(alamatController: _alamatController),
                  ButtonSignInDokter(formkeySignUpDokter: _formkeySignUpDokter),
                  OrContinue(),
                  ButtonGoogleAdmin(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 24, right: 24, top: 20, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sudah memiliki akun ',
                          style: TextStyle(color: kblue, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()));
                          },
                          child: Text(
                            'Login ',
                            style: TextStyle(
                                color: kgreen,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class FormPassSignUpAdmin extends StatefulWidget {
  const FormPassSignUpAdmin({
    Key? key,
    required TextEditingController passController,
  })  : _passController = passController,
        super(key: key);
  final TextEditingController _passController;

  @override
  State<FormPassSignUpAdmin> createState() => _FormPassSignUpAdminState();
}

class _FormPassSignUpAdminState extends State<FormPassSignUpAdmin> {
  bool _isHidePass = true;
  final TextEditingController _passController = TextEditingController();
  void togglePassword() {
    setState(() {
      _isHidePass = !_isHidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPassword(
        hintexts: 'Password',
        icons: Icon(
          Icons.lock,
          color: kgreen,
        ),
        sufIcons: IconButton(
            onPressed: () {
              setState(() {
                _isHidePass = !_isHidePass;
              });
            },
            icon: Icon(
              _isHidePass ? Icons.visibility_off : Icons.visibility,
              color: _isHidePass ? kgrey : kgreen,
            )),
        obscure: _isHidePass,
        validatorText: 'validatorText',
        inputType: TextInputType.visiblePassword,
        controll: _passController);
  }
}

class FormAlamatAdmin extends StatelessWidget {
  const FormAlamatAdmin({
    Key? key,
    required TextEditingController alamatController,
  })  : _alamatController = alamatController,
        super(key: key);

  final TextEditingController _alamatController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: _alamatController,
        maxLines: 4,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide(color: kgrey, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide(color: kgreen, width: 1)),
            hintText: 'Alamat',
            prefixIcon: Icon(
              Icons.home,
              color: kgreen,
            )),
      ),
    );
  }
}

class FormEmailSignUpAdmin extends StatelessWidget {
  const FormEmailSignUpAdmin({
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

class FormPhoneSignUpAdmin extends StatelessWidget {
  const FormPhoneSignUpAdmin({
    Key? key,
    required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
        hintext: 'No Telephon',
        TextValue: 'Isi Nomor',
        icon: Icon(
          Icons.phone,
          color: kgreen,
        ),
        KeyboardType: TextInputType.phone,
        controll: _phoneController);
  }
}

class FormInstansiAdmin extends StatelessWidget {
  const FormInstansiAdmin({
    Key? key,
    required TextEditingController instansiController,
  })  : _instansiController = instansiController,
        super(key: key);

  final TextEditingController _instansiController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
        hintext: 'Nama Instansi',
        TextValue: 'Isi nama Instansi',
        icon: Icon(
          Icons.home,
          color: kgreen,
        ),
        KeyboardType: TextInputType.text,
        controll: _instansiController);
  }
}

class ButtonSignInDokter extends StatelessWidget {
  const ButtonSignInDokter({
    Key? key,
    required GlobalKey<FormState> formkeySignUpDokter,
  })  : _formkeySignUpDokter = formkeySignUpDokter,
        super(key: key);

  final GlobalKey<FormState> _formkeySignUpDokter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: CustomButton(
          text: 'Daftar',
          onPressed: () {
            if (_formkeySignUpDokter.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInPage()));
            }
          },
          color: kgreen),
    );
  }
}
