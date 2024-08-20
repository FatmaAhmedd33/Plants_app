
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/contants.dart';
import 'package:flower_app/pages/home.dart';
import 'package:flower_app/pages/register.dart';
import 'package:flower_app/widgets/custom_buttom.dart';
import 'package:flower_app/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snake_bar.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
             // scrollDirection: Axis.horizontal,
              children: [
                
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  kLogo,
                  height: 200,
                  width: 500,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Your Plant App',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    //wrap this text in row to make it in the defult of row in thwe start of page
                    Text(
                      'sign in',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                    onchange: (data) => email = data, text: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                    onchange: (data) => password = data, text: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  ontap: () async {
                    //var auth = FirebaseAuth.instance; you can you the instant directly instead of create object
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        //to update ui
                      });

                      try {
                        await loginUser();
                       showSnackBar(context, 'your login is successed');
                        Navigator.pushNamed(context, HomePage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {
                        //to update ui
                      });
                    } else {}
                  },
                  text: 'login',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        'register',
                        style: TextStyle(color: Color(0xff5AB4BD)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
