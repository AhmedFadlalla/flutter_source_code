import 'package:bmi_flutter_app/layout/social_app/social_home_screen.dart';
import 'package:bmi_flutter_app/modules/social_app/social_login_screen/login_social_cubit/states.dart';
import 'package:bmi_flutter_app/modules/social_app/social_register_screen/social_register_cubit/cubit.dart';
import 'package:bmi_flutter_app/modules/social_app/social_register_screen/social_register_cubit/states.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    var emailController = TextEditingController();
    String emailLabel = 'Email Address';

    var passwordController = TextEditingController();
    String passwordLabel = 'Password';

    var phoneController = TextEditingController();
    String phoneLabel = 'Phone';

    return BlocProvider(
       create: (context)=>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context,state){
          if (state is socialCreateUserrSuccefulState)
            {
              navigateAndFinsh(context, SocialHomeLayout());
            }
        },
        builder: (context,state){
          SocialRegisterCubit cubit=SocialRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Welcome to social app',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 20,),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Name must not be empty';
                              }
                            },
                            label: 'name',
                            prefixIcon: Icons.person),
                        SizedBox(
                          height: 20.0,
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
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'phone number must not be empty';
                              } else
                                return null;
                            },
                            label: phoneLabel,
                            prefixIcon: Icons.phone),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                            condition: state is! socialRegisterLodingState,
                            builder: (context)=>defultButton(
                                function: (){
                                  cubit.userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text);

                                },
                                text: 'Register'),
                            fallback:(context)=> Center(child: CircularProgressIndicator(),)),

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
