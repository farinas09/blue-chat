import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels_widget.dart';
import 'package:chat_app/widgets/logo_widget.dart';
import 'package:chat_app/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(),
                _Form(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton.mini(
                      buttonSize: ButtonSize.medium,
                      buttonType: ButtonType.google,
                      onPressed: () {
                        print('click');
                      },
                    ),
                    SignInButton.mini(
                      buttonSize: ButtonSize.medium,
                      buttonType: ButtonType.facebook,
                      onPressed: () {
                        print('click');
                      },
                    ),
                    SignInButton.mini(
                      buttonSize: ButtonSize.medium,
                      buttonType: ButtonType.apple,
                      onPressed: () {
                        print('click');
                      },
                    )
                  ],
                ),
                Column(
                  children: [
                    Labels(
                      isSignIn: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Términos y condiciones de uso',
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomInput(
            hint: "Username",
            icon: Icons.person,
            keyboardType: TextInputType.emailAddress,
            controller: _userController,
          ),
          CustomInput(
            hint: "Email",
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          CustomInput(
            hint: "Password",
            icon: Icons.lock,
            keyboardType: TextInputType.text,
            isPasword: true,
            controller: _passwordController,
          ),
          CustomInput(
            hint: "Confirm Password",
            icon: Icons.lock,
            keyboardType: TextInputType.text,
            isPasword: true,
            controller: _confirmPwdController,
          ),
          SubmitButton(
            text: 'Register Now',
            callback: () {},
          )
        ],
      ),
    );
  }
}
