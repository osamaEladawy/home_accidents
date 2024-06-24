
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../layout/doc_app/cubit/cubit.dart';
import '../../../layout/doc_app/cubit/states.dart';
import '../../../shared/components/components.dart';
import 'screens/a__screen.dart';
import 'screens/b__screen.dart';
import 'screens/c__screen.dart';
import 'screens/d__screen.dart';
import 'screens/e__screen.dart';
import 'screens/f__screen.dart';
import 'screens/g__screen.dart';
import 'screens/h__screen.dart';
import 'screens/i__screen.dart';
import 'screens/j__screen.dart';
import 'screens/k__screen.dart';
import 'screens/l__screen.dart';
import 'screens/m__screen.dart';
import 'screens/n__screen.dart';

class ab_BurnsScreen extends StatefulWidget {
  const ab_BurnsScreen({Key? key}) : super(key: key);

  @override
  State<ab_BurnsScreen> createState() => _ab_BurnsScreenState();
}
  class _ab_BurnsScreenState extends State<ab_BurnsScreen>{
  late bool isPlaying  , isMute ;
  final String url='https://youtu.be/wabnwvqaVMk';
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;


  @override
  void initState() {
    super.initState();
    isMute = false;
    id=YoutubePlayer.convertUrlToId(url)!;
    _controller=YoutubePlayerController(initialVideoId: id,
    flags: const YoutubePlayerFlags(autoPlay: false,)
    );
    youtubePlayer = YoutubePlayer(controller: _controller);
    isPlaying = _controller.value.isPlaying;

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics:  const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.topCenter,

                      height: size.height * .3,

                  child: youtubePlayer,
                  //child: BookInfo(size: size,)
              ),
            ),


            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const a_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "تعريف الحروق",
                        press: () {
                          navigateTo(context, const a_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const b_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الحروق السطحية",
                        press: () {navigateTo(context, const b_BurnsScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const c_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الحروق ذات السماكة الجزئية ",
                        press: () {navigateTo(context, const c_BurnsScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const d_BurnsScreen());
                      },
                      child: ChapterCard(

                        name: "الحروق العميقة ",
                        press: () {navigateTo(context, const d_BurnsScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const e_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الحروق بسمك كامل",
                        press: () {
                          navigateTo(context, const e_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const f_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الاسباب",
                        press: () {
                          navigateTo(context, const f_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const g_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "لتجنب الحروق",
                        press: () {
                          navigateTo(context, const g_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const h_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "عوامل خطوره الحروق",
                        press: () {
                          navigateTo(context, const h_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const i_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الاسعافات الاولية للدرجة الأولى",
                        press: () {
                          navigateTo(context, const i_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const j_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الاسعافات الاولية للدرجة الثانيه",
                        press: () {
                          navigateTo(context, const j_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const k_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الاسعافات الاولية للدرجة الثالثه",
                        press: () {
                          navigateTo(context, const k_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const l_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "ادوية الحروق",
                        press: () {
                          navigateTo(context, const l_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const m_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الحروق الكهربائية",
                        press: () {
                          navigateTo(context, const m_BurnsScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const n_BurnsScreen());
                      },
                      child: ChapterCard(
                        name: "الحروق الكيميائية",
                        press: () {
                          navigateTo(context, const n_BurnsScreen());
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }

  textBuilder(String string, {double fontSize = 17, FontWeight weight = FontWeight.normal, Color color = Colors.black})
  {
    return Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(
              string,
              style: TextStyle(fontSize: fontSize,
              fontWeight: weight,
              color: color,
              ),
        ));
  }





  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}

class ChapterCard extends StatelessWidget {
  final String name;
  final VoidCallback? press;
  const ChapterCard({super.key, 
  //  required Key key,
    required this.name,
    required this.press,
  }) ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<DocCubit , DocStates>(
        listener: (context, state){},
    builder: (context, state) {
      var cubit = DocCubit.get(context);
      Color colorText = cubit.isDark ? Colors.white : Colors.black;
      Color colorContainer = cubit.isDark ? Colors.grey : Colors.white;

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: const EdgeInsets.only(bottom: 16),
        width: size.width *.95,
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 33,
              color: cubit.isDark ? const Color(0xFFD3D3D3).withOpacity(.3) : const Color(0xFFD3D3D3).withOpacity(.99),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                size: size.width *0.05,
                color: colorText,
              ),
              onPressed: press,
            ),
            const Spacer(),
            Center(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: size.width * .04,
                  color: colorText,
                  fontWeight: FontWeight.w800,
              
              
                ),
              
              
              ),

            ),


          ],

        ),
      );
    }
    );
  }
}

