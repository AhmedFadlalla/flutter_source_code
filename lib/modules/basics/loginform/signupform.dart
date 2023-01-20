import 'package:bmi_flutter_app/modules/basics/loginform/loginform.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();
  var phoneController=TextEditingController();
  String nameLabel='Name';
  String emailLabel='Email';
  String passwordLabel='Password';
  String confirmPasswordLabel='Confirm Password';
  String phoneLabel='phone';

  var FormKey = GlobalKey<FormState>();
  var scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('SIGN UP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40.0),
              child: Form(
                key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child:  Text(
                          'Let\'s Get Started!',
                          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text('Create an account to Q Allure to get all feature',style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 40.0,),
                      Column(
                        children: [
                          defultLoginField(
                            controller: nameController,
                            inputType: TextInputType.name,
                            labelText: nameLabel,
                            preIcon: Icons.person,
                            tabFunction: (){

                            },
                            validation: (value){
                              if(value.isEmpty){
                                return 'name must not be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0,),
                          defultLoginField(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            labelText: emailLabel,
                            preIcon: Icons.email_outlined,
                            tabFunction: (){

                            },
                            validation: (value){
                              if(value.isEmpty){
                                return 'E-mail Address  must not be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0,),
                          defultLoginField(
                            controller: phoneController,
                            inputType: TextInputType.phone,
                            labelText: phoneLabel,
                            preIcon: Icons.phone_android,
                            tabFunction: (){

                            }, validation: (value){
                            if(value.isEmpty){
                              return 'phone must not be empty';
                            }
                            return null;

                          },
                          ),
                          SizedBox(height: 30.0,),
                          defultLoginField(
                            controller: passwordController,
                            inputType: TextInputType.visiblePassword,
                            labelText: passwordLabel,
                            preIcon: Icons.lock_open,
                            tabFunction: (){

                            }, validation: (value){
                            if(value.isEmpty){
                              return 'Password must not be empty';
                            }
                            return null;

                          },
                          ),
                          SizedBox(height: 30.0,),
                          defultLoginField(
                            controller: confirmPasswordController,
                            inputType: TextInputType.visiblePassword,
                            labelText: confirmPasswordLabel,
                            preIcon: Icons.lock_open,
                            tabFunction: (){


                            }, validation: (value){
                            if(value.isEmpty){
                              return 'Confirm Password must not be empty';
                            }
                            return null;

                          },
                          ),
                        ],
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        width: 170.0,
                        child: materialButtomLogin(
                            pressFunction:(){
                              if (FormKey.currentState!.validate()){
                                print(nameController.text);
                                print(emailController.text);
                                print(passwordController.text);
                                print(phoneController.text);
                                print(confirmPasswordController.text);

                              }
                            } ,
                            bottomText: 'CREATE',
                            radius: 40.0,
                            backgroundColor: Colors.blue.withOpacity(0.8)

                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",style: TextStyle(color: Colors.grey,fontSize:16.0)),
                          materialButtomLogin(
                              pressFunction: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:(BuildContext context)=>LoginForm(),
                                    )
                                );

                              },
                              textColor:Colors.blue,
                              bottomText: 'Login here'),

                        ],
                      ),
                    ],
                  ),

              ),





        ),
      )


    );
  }
}
