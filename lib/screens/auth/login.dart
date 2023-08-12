import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_users/const/my_validators.dart';
import 'package:shop_users/root_screen.dart';
import 'package:shop_users/screens/auth/forgot_password.dart';
import 'package:shop_users/screens/auth/register.dart';
import 'package:shop_users/widget/app_name_text.dart';
import 'package:shop_users/widget/auth/google_button.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routName = "/LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obsecure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const AppNameTextWidget(
                  fontsize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(
                        lable: "Welcome Back",
                      ),
                      SubTitleTextWidget(
                        lable: "Let's get logged in so you start exploring.",
                        fontSize: 17,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email address",
                          prefixIcon: Icon(IconlyLight.message),
                        ),
                        validator: (value) {
                          return MyValidators.emailValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          _loginFct();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        obscureText: obsecure,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "********",
                          prefixIcon: const Icon(IconlyLight.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecure = !obsecure;
                              });
                            },
                            icon: Icon(obsecure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          return MyValidators.passwordValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          _loginFct();
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgotPasswordScreen.routeName);
                          },
                          child: const SubTitleTextWidget(
                            lable: "Forget Password ?",
                            textDecoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                          ),
                          onPressed: () {
                            _loginFct();
                          },
                          icon: const Icon(IconlyLight.logout),
                          label: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SubTitleTextWidget(
                        lable: "or connect using".toUpperCase(),
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: GoogleButton(),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                padding: const EdgeInsets.all(12),
                              ),
                              onPressed: () {
                                // _loginFct();
                                Navigator.pushNamed(
                                    context, RootScreen.routName);
                              },
                              child: const Text(
                                "Guest",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SubTitleTextWidget(
                              lable: "Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routName);
                            },
                            child: const SubTitleTextWidget(
                              lable: "Sign up ",
                              textDecoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
