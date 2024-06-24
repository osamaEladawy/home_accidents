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

class ai_FractionScreen extends StatefulWidget {
  const ai_FractionScreen({Key? key}) : super(key: key);

  @override
  State<ai_FractionScreen> createState() => _ai_FractionScreenState();
}
  class _ai_FractionScreenState extends State<ai_FractionScreen>{
  late bool isPlaying  , isMute ;
  final String url='https://www.youtube.com/watch?v=zNdF6iaPdI8';
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isMute = false;
    id=YoutubePlayer.convertUrlToId(url)!;
    _controller=YoutubePlayerController(initialVideoId: id,
    flags: YoutubePlayerFlags(autoPlay: false,)
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
        physics:  BouncingScrollPhysics(),
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
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, a_FractionScreen());
                      },
                      child: Container(
                        child: ChapterCard(
                          name: "تعريف الكسور",
                          press: () {
                            navigateTo(context, a_FractionScreen());
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, b_FractionScreen());
                      },
                      child: ChapterCard(
                        name: "الأعراض",
                        press: () {navigateTo(context, b_FractionScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, c_FractionScreen());
                      },
                      child: ChapterCard(
                        name: "الوقايا من الكسور",
                        press: () {navigateTo(context, c_FractionScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, d_FractionScreen());
                      },
                      child: ChapterCard(

                        name: "الإسعافات للكسر المفتوح",
                        press: () {navigateTo(context, d_FractionScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, e_FractionScreen());
                      },
                      child: ChapterCard(
                        name: "الإسعافات للكسر المغلق",
                        press: () {
                          navigateTo(context, e_FractionScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, f_FractionScreen());
                      },
                      child: ChapterCard(
                        name: "كسور الرقبة والعمود الفقري",
                        press: () {
                          navigateTo(context, f_FractionScreen());
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, g_FractionScreen());
                      },
                      child: ChapterCard(
                        name: "الإسعافات لكسر العمود الفقري",
                        press: () {
                          navigateTo(context, g_FractionScreen());
                        },
                      ),
                    ),
                    SizedBox(height: 10),
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
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

}

class ChapterCard extends StatelessWidget {
  final String name;
  final VoidCallback? press;
  const ChapterCard({
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: EdgeInsets.only(bottom: 16),
        width: size.width *.95,
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 33,
              color: cubit.isDark ? Color(0xFFD3D3D3).withOpacity(.3) : Color(0xFFD3D3D3).withOpacity(.99),
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
            Spacer(),
            Center(
              child: Expanded(
                child: Text(
                  "${name}",
                  style: TextStyle(
                    fontSize: size.width * .04,
                    color: colorText,
                    fontWeight: FontWeight.w800,


                  ),


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

