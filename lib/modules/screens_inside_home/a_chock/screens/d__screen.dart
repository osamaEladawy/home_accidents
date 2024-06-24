import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/doc_app/cubit/cubit.dart';
import '../../../../layout/doc_app/cubit/states.dart';



class d_ChockScreen extends StatelessWidget {
  const d_ChockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<DocCubit , DocStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = DocCubit.get(context);
        Color color = cubit.isDark ? Colors.white: Colors.black;
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics:  BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('الإسعافات الأولية للاختناق',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: color
                      ),
                    ),

                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: size.height * .12,
                          left: size.width * .1,
                          right: size.width * .02),
                      height: size.height * .48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/chock4.png"),
                          fit: BoxFit.contain,
                        ),

                      ),
                      //child: BookInfo(size: size,)
                    ),

                    Column(
                      children: [
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,

                            child: Text(
                              '''
-	إذا كان الطفل المختنق يستطيع السعال بقوة، فدعه يستمر في السعال. قد يزيل السعال الجسم العالق بشكل طبيعي.
-	إذا كان الطفل المختنق لا يستطيع السعال أو الحديث أو البكاء أو الضحك بقوة، فقدم إليه الإسعافات الأولية بإجراء الخطوات الآتية:

                              ''',
                              textAlign:TextAlign.start ,

                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: color,
                              ),
                            ),

                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: Text(
                            '''للطفل المختنق''',
                            textAlign:TextAlign.start ,

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red,

                            ),
                          ),

                        ),
                        Image(image: AssetImage('assets/images/chock6.jpg')),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,

                            child: Text(
                              '''
👈قم بإجراء مناورة هايمليش (ضربات الظهر):
•	قف وراء الطفل المختنق مباشرة. وإن كان الطفل فصيرا، فاجثُ على ركبتيك خلفه. 
•	ضع ذراعك على صدر الطفل لدعم جسمه واثنِ جسم الطفل من عند الخصر ليكون مواجهًا للأرض. 
•	اضرب خمس ضربات منفصلة بين لوحي كتف الطفل باستخدام أسفل راحة يدك.
•	إذا لم تؤدّ ضربات الظهر إلى إزالة الجسم العالق

👈قم بإجراء مناورة هايمليش (ضغطات البطن):
•	قف خلف الطفل وإن كان صغيرا، فاجثُ على ركبتيك خلفه.
•	ضع إحدى قدميك أمام الأخرى مع وضعها بين قدمي الطفل للحفاظ على توازنك
•	لف ذراعك حول الخصر. أمِل الطفل إلى الأمام قليلاً.
•	قم بعمل قبضة بإحدى يديك وضعها أعلى سرة الطفل مباشرة واجذب قبضتك بيدك الأخرى.
•	اضغط خمس ضغطات على البطن.، ضغطات سريعة متجهة إلى أعلى كأنك تحاول رفع ذلك الطفل إلى أعلى وإن كان صغيرا، فاستخدم ضغطة خفيفة وقوية في الوقت نفسه لتجنب إلحاق الضرر بالأعضاء الداخلية.
•	تحقق مما إذا كان الانسداد قد أُزيل أم لا.
•	بدّل بين الضربات الخمسة والضغطات الخمسة حتى يزول الانسداد.
•	إذا كنت أنت وحدك من يقوم بالإنقاذ، فوجِّه ضربات الظهر وضغطات البطن أولاً. ثم اتصل برقم 123 لطلب الاسعاف. إذا كان معك شخص آخر، فاطلب منه الاتصال لطلب المساعدة بينما تقدم أنت الإسعافات الأولية.
•	في حال فقدان الطفل الوعي، ابدأ إجراءات الإنعاش القلبي الرئوي القياسي باستخدام الضغطات على الصدر والتنفس الصناعي.

👈لفتح المجرى الهوائي للطفل فاقد الوعي:
•	ضع الطفل مستلقيًا على الأرض بحيث يكون ظهره على الأرض وذراعيه إلى جانبيه.
•	افتح مجرى الهواء. إذا كان بإمكانك رؤية الجسم، فضع إصبعًا داخل الفم لسحبه. لا تستخدم إصبعك للسحب أبدًا إذا كنت لا ترى الجسم. فأنت بذلك تخاطر بدفع الجسم المتسبب في الانسداد بشكل أعمق داخل المجرى الهوائي. وهذا خطير للغاية بالنسبة للأطفال الصغار.
•	ابدأ الإنعاش القلبي الرئوي إذا كان الشخص لا يزال غير مستجيب. إذا كان المجرى الهوائي لا يزال مسدودًا، فاستخدم ضغطات الصدر مثل تلك المستخدمة في الإنعاش القلبي الرئوي لإزالة الجسم العالق. ولا تستخدم سوى نفسين إنقاذيين لكل دورة. أعد التحقق من الفم بانتظام للبحث عن الجسم.

                              ''',
                              textAlign:TextAlign.start ,

                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: color,
                              ),
                            ),

                          ),
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: Text(
                            '''للطفل الرضيع المختنق''',
                            textAlign:TextAlign.start ,

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red,

                            ),
                          ),

                        ),
                        Image(image: AssetImage('assets/images/chock5.jpg')),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,

                            child: Text(
                              '''
•	اجلس وأمسك الرضيع على ساعدك بحيث يكون مواجهًا للأسفل. واسند ساعدك على فخذك. أمسك ذقن الرضيع وفكه لدعم الرأس. واجعل رأسه في وضعية أخفض من جذعه.
•	اضرب الرضيع ضربات خفيفة ولكنها موثرة في الوقت نفسه خمس مرات على منتصف الظهر. استخدم أسفل راحة يدك. أشر بأصابعك للأعلى حتى لا تضرب مؤخرة رأس الرضيع. ستؤدي الجاذبية والضربات على الظهر إلى إزالة الانسداد.
•	إذا لم تؤدّ ضربات الظهر إلى إزالة الجسم العالق
•	ضع الرضيع على ساعدك ووجهه للأعلى إذا لم يبدأ التنفس بعد. اسند ذراعك على فخذك. اجعل رأس الرضيع في وضعية أخفض من جذعه.
•	اضغط خمس ضغطات خفيفة ولكنها مؤثرة في الوقت نفسه باستخدام أصابعك. ضع إصبعين أسفل الصدر مباشرة.  اضغط لمسافة بوصة ونصف. ثم دع الصدر يرتفع بين كل ضغطة وأخرى.
•	كرر ضربات الظهر وضغطات الصدر إذا لم يبدأ التنفس. اطلب المساعدة الطبية الطارئة.
•	ابدأ الإنعاش القلبي الرئوي للرضيع إذا فُتح المجرى الهوائي لكن لم يستعد الرضيع النفس.

                              ''',
                              textAlign:TextAlign.start ,

                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: color,
                              ),
                            ),

                          ),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
