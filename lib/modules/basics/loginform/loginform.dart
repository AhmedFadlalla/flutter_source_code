import 'package:bmi_flutter_app/modules/basics/loginform/signupform.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  String emailLabelText = 'E-Mail Address';
  String passwordLabelText = 'Password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Screen",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: Form(
                  key: FormKey,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/login.png'),
                              width: 150,
                              height: 150,
                            ),
                            Text('Welcome back!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Log in to your existant account of Q Allure',
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defultLoginField(
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          labelText: emailLabelText,
                          preIcon: Icons.person_outline,
                          tabFunction: () {},
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Email address must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      defultLoginField(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        labelText: passwordLabelText,
                        preIcon: Icons.lock_open,
                        tabFunction: () {},
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          materialButtomLogin(
                              pressFunction: () {},
                              textColor: Colors.black,
                              bottomText: 'Forgot Password?'),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150.0,
                            child: materialButtomLogin(
                                pressFunction: () {
                                  if (FormKey.currentState!.validate()) {
                                    print(emailController.text);
                                    print(passwordController.text);
                                  }
                                },
                                bottomText: 'LOG IN',
                                backgroundColor: Colors.blue,
                                radius: 40.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or connect Using',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 100.0,
                              height: 35.0,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/images/facebook.png"),
                                  color: Colors.lightBlue,),
                                  materialButtomLogin(
                                      pressFunction: () {},
                                      bottomText: 'Facebook',
                                      backgroundColor: Colors.lightBlue,
                                      radius: 8.0),
                                ],
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                              width: 100.0,
                              height: 35.0,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/images/gmail.png")),
                                  materialButtomLogin(
                                      pressFunction: () {},
                                      bottomText: 'Google',
                                      backgroundColor: Colors.lightBlue,
                                      radius: 8.0),
                                ],
                              )

                              // child:
                              ),

                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don\'t have an account?",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 16.0)),
                          materialButtomLogin(
                              pressFunction: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpForm(),
                                    ));
                              },
                              textColor: Colors.black,
                              bottomText: 'Sign Up'),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
