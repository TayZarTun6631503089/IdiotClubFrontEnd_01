import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idiot_community_club_app/Components/ButtonComponents.dart';
import 'package:idiot_community_club_app/Components/LoginComponent.dart';

class ComReg extends StatefulWidget {
  const ComReg({super.key});

  @override
  State<ComReg> createState() => _ComRegState();
}

class _ComRegState extends State<ComReg> {
  bool showPassword = false;
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenDeco.getWholeGradientScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset("assets/images/WhiteLogo.png"),
                    SizedBox(height: 10),
                    ButtonComponents.getLogoText(
                      "IDIOT COMMUNITY CLUB",
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          ButtonComponents.getMyGradientText("Sign Up", 25),
                          ButtonComponents.getMyGradientText(
                            "Sign up now to join amazing clubs!",
                            12,
                          ),
                          SizedBox(height: 20),
                          ButtonComponents.getMyGradientText("Username", 18),
                          Loginwidget.inputBox(
                            myController: userNameController,
                            getInput: (value) {},
                            myLabel: "Enter Your Username",
                          ),
                          ButtonComponents.getMyGradientText("Email", 18),
                          Loginwidget.inputBox(
                            myController: emailController,
                            getInput: (value) {},
                            myLabel: "Enter Your Email",
                          ),
                          ButtonComponents.getMyGradientText("Password", 18),
                          Loginwidget.inputBox(
                            getInput: (value) {},
                            myLabel: "Enter Your Password",
                            myObsecure: !showPassword,
                            password: true,
                            togglePassword: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            myController: passwordController,
                          ),
                          ButtonComponents.getMyGradientText(
                            "Re-Enter Password",
                            18,
                          ),
                          Loginwidget.inputBox(
                            getInput: (value) {},
                            myLabel: "Confirm Your Password",
                            myObsecure: !showPassword,
                            password: true,
                            togglePassword: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            myController: rePasswordController,
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/communityMemberHome",
                              );
                            },
                            child: ButtonComponents.getGradientBox(
                              text: "Sign Up",
                              size: 20,
                              myRadius: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 12),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/creatorLogin");
                                },
                                child: ButtonComponents.getMyGradientText(
                                  "Log in",
                                  12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenDeco {
  static Container getWholeGradientScreen({Widget? child}) {
    return Container(
      decoration: BoxDecoration(gradient: ButtonComponents.myGradientLTR),
      child: child,
    );
  }
}
