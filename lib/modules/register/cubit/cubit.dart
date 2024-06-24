import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  late LoginModel? loginModel;

  void userRegister({
    required String name ,
    required String email ,
    required String password ,
    required String phone ,

  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'name':name,
          'email':email,
          'password':password,
          'phone':phone,
        },
    ).then((value) {
      print(value?.data);
      loginModel = LoginModel.fromJson(value?.data);

      emit(RegisterSuccessState(loginModel!));
    }).catchError((error){
      print('error ====================');
      print(error.toString());
      print('error ====================');

      emit(RegisterErrorState(error.toString()));

    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangePasswordVisibilityState());
      }
}