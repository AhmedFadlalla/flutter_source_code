import 'package:bmi_flutter_app/layout/social_app/social_home_screen.dart';
import 'package:bmi_flutter_app/modules/social_app/social_register_screen/social_register_screen.dart';

import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_social_cubit/cubit.dart';
import 'login_social_cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    String emailLabel = 'Email Address';

    var passwordController = TextEditingController();
    String passwordLabel = 'Password';
    return BlocProvider(
        create: (BuildContext context) => SocialLoginCubit(),
        child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
          listener: (context, state) {
            if (state is socialLoginErrorState) {
              showToast(text: state.error, state: ToastStates.ERROR);
            }

            if(state is socialLoginSuccefulState){
              CachHelper.saveData(key: 'uId', value:state.uId )
                  .then((value) {

                  navigateAndFinsh(context, SocialHomeLayout());
              });

            }
          },
          builder: (context, state) {
            SocialLoginCubit cubit = SocialLoginCubit.get(context);
            return Scaffold(
              appBar: AppBar(),
              body: Center(
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
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            'Login now to communicate with friends',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Email address must not be empty';
                                } else
                                  return null;
                              },
                              label: emailLabel,
                              prefixIcon: Icons.email_outlined),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password must not be empty';
                                } else
                                  return null;
                              },
                              onsubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              label: passwordLabel,
                              isPassword: cubit.isPassword,
                              suffixIcon: cubit.suffixIcon,
                              sufixPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              prefixIcon: Icons.lock),
                          SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilder(
                              condition: state is! socialLoginLodingState,
                              builder: (context) => defultButton(
                                  function: () {
                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  },
                                  text: 'LOGIN',
                                  isUpperCase: true),
                              fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              defultTextButton(
                                  pressedFunction: () {
                                    navigateTo(context, SocialRegisterScreen());
                                  },
                                  text: 'Register now')
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
        ));
  }
}
