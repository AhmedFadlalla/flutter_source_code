
import 'package:bmi_flutter_app/layout/shop_app/shop_layout.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_login/login_cubit/cubit.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_login/login_cubit/states.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_register_screen/shop_register_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    String emailLabel='Email Address';

    var passwordController=TextEditingController();
    String passwordLabel='Password';
    return BlocProvider(
      create: (BuildContext context) =>loginCubit(),
      child: BlocConsumer<loginCubit,loginStates>(
        listener: (context,state){
          if(state is loginSuccefulState){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
       CachHelper.saveData(key: 'token', value: state.loginModel.data!.token);
       navigateAndFinsh(context, ShopLayout());
            }
            else{
              print(state.loginModel.message);
              showToast(text: state.loginModel.message, state:ToastStates.ERROR );
            }

          }

        },
        builder: (context,state){
          var cubit=loginCubit.get(context);
          return Scaffold(
            appBar:AppBar() ,
            body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black
                          ),

                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey
                          ),

                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Email address must not be empty';
                              }
                              else return null;

                            },
                            label: emailLabel,
                            prefixIcon: Icons.email_outlined),
                        SizedBox(height: 20.0,),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Password must not be empty';
                              }
                              else return null;

                            },
                            onsubmit: (value){
                              if(formKey.currentState!.validate()){

                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);

                              }
                            },
                            label: passwordLabel,
                            isPassword: cubit.isPassword,
                            suffixIcon: cubit.suffixIcon,
                            sufixPressed: (){
                              cubit.changePasswordVisibility();
                            },
                            prefixIcon: Icons.lock),
                        SizedBox(
                          height: 20.0,
                        ),
                        state is! loginLoadingState?
                        defultButton(
                            function: (){
                              if(formKey.currentState!.validate()){

                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);

                              }


                            },
                            text: 'LOGIN',
                        isUpperCase: true):Center(child: CircularProgressIndicator(),),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?'),
                            defultTextButton(
                                pressedFunction: (){
                                  navigateTo(context, ShopRegisterScreen());
                                },
                                text: 'Register now'

                            )
                          ],
                        )




                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
