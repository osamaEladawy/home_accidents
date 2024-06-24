// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constant.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../splash_screen/splash_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) => RegisterCubit() ,
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (BuildContext context, Object? state) {
          if (state is RegisterSuccessState)
          {
            if(state.loginModel.status == true)
            {
              print(state.loginModel.message);
              print(state.loginModel.data?.token);

              ShowToast(
                  text: state.loginModel.message!,
                  state: ToastState.SUCCESS
              );
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data?.token,
              ).then((value) {
                token = state.loginModel.data!.token!;
                navigateAndFinish(context, const SplashScreen());
              });


            }else{
              print(state.loginModel.message);
              ShowToast(
                  text:state.loginModel.message! ,
                  state: ToastState.ERROR
              );
            }
          }
        },
        builder: (context , state)
        {
          //var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create an Account',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.black
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            label: 'Name',
                            prefix: Icons.person,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'please enter your name';
                              }
                            }
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: 'phone number',
                            prefix: Icons.phone,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'please enter your phone';
                              }
                            }
                            
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email',
                            prefix: Icons.email_outlined,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'please enter your email address';
                              }
                            }
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            suffix: RegisterCubit.get(context).suffix,
                            onSubmit: (value){},
                            isPassword: RegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              RegisterCubit.get(context).changePasswordVisibility();
                            },
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'password is too short';
                              }
                            }
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder:(context) => defaultButton(
                              function:(){
                                CacheHelper.removeDate(key: 'token');
                                if(formKey.currentState!.validate()){
                                  RegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }

                              },
                              text: 'Create Account',
                              isUpperCase: false,

                            ),
                            fallback:(context) => const CircularProgressIndicator() ,
                          ),
                        ),

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

