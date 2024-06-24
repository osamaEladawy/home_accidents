import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/doc_app/cubit/cubit.dart';
import '../../layout/doc_app/cubit/states.dart';


class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var doctorsSearchController = TextEditingController();
    return BlocConsumer<DocCubit, DocStates>(
      listener: (context , state){},
      builder: (context , state) {
        var cubit = DocCubit.get(context);
        Color color = cubit.isDark ? Colors.white: Colors.black;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('''حوادث المنازل هو تطبيق مجاني غير ربحي يهدف إلي تعليم العامه الطرق الصحيحة والسليمة للتعامل مع الحوادث الشائعة في المنزل مثل
*    الحروق 
*    السقوط 
*    الإختناق
*   الإغماء
*   التسمم
*   جروح الأنف 
*   الإلتواء
*   اللدغات
*   الكسور
*   الجروح
*   اصابات العين
*   الغرق
*   الخنق
بغرض توفير مادة علمية تساعد في التعامل السريع لتقليل الأضرار الناتجة عن تلك الحوادث.

''',
                  style: TextStyle(
                      fontSize: 20,
                    color: color
                  ),
                ),
              )
            ],
          ),
        );
      },

    );
  }
}
