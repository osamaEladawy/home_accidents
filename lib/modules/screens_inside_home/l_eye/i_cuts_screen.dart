
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

class al_EyeScreen extends StatefulWidget {
  const al_EyeScreen({Key? key}) : super(key: key);

  @override
  State<al_EyeScreen> createState() => _al_EyeScreenState();
}
  class _al_EyeScreenState extends State<al_EyeScreen>{
  late bool isPlaying  , isMute ;
  final String url='https://youtu.be/l_xsAdhMmFs';
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
                        navigateTo(context, const a_EyeScreen());
                      },
                      child: Container(
                        child: ChapterCard(
                          name: "مقدمة",
                          press: () {
                            navigateTo(context, const a_EyeScreen());
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const b_EyeScreen());
                      },
                      child: ChapterCard(
                        name: "الأعراض",
                        press: () {navigateTo(context, const b_EyeScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const c_EyeScreen());
                      },
                      child: ChapterCard(
                        name: "الإسعافات الأولية ",
                        press: () {navigateTo(context, const c_EyeScreen());},
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const d_EyeScreen());
                      },
                      child: ChapterCard(

                        name: "طرق الوقاية",
                        press: () {navigateTo(context, const d_EyeScreen());},
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

