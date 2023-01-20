import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginBuildScreen();
}


class _LoginBuildScreen extends State<LoginScreen>{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword=true;

  var formKey=GlobalKey<FormState>();
  final String emailLabel='Email Address';
  final String passwordLabel='Password';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child:Form(
                  key:formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type:TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'E-Mail address must not be empty';
                            }
                            return null;

                          },
                          label:emailLabel,
                          prefixIcon: Icons.email,
                          onChange: (value){
                            print(value);
                          },
                          onsubmit: (value){
                            print(value);
                          }


                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type:TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Password must not be  empty';
                            }
                            return null;

                          },
                          label:passwordLabel,
                          prefixIcon: Icons.lock,
                          suffixIcon: isPassword?Icons.visibility:Icons.visibility_off,
                          onChange: (value){
                            print(value);
                          },
                          onsubmit: (value){
                            print(value);
                          },
                          isPassword: isPassword,
                          sufixPressed: (){
                            setState(() {
                              isPassword=!isPassword;
                            });

                          }


                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defultButton(function: (){
                        if(formKey.currentState!.validate()){
                          print(emailController.text);
                          print(passwordController.text);
                        }},
                          text:"login"),
                      SizedBox(
                        height: 10.0,
                      ),
                      defultButton(
                        function: (){
                          if(formKey.currentState!.validate()){
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                        text:"SEtUp",
                        background: Colors.red,
                        radius: 20.0,),

                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Register Now',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ) ,

              ),
            ),
          ),
        )
    );
  }

}

