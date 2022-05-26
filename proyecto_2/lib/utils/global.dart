import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Global {

static const Color colorWhite = const Color(0xffffffffff);
  static const Color colorDark = const Color.fromARGB(255, 71, 59, 76);
  static const Color colorPurple = const Color.fromARGB(255, 190, 72, 229);
  static const Color colorBlack = const Color(0xff0000);

  static void mensaje(BuildContext context, String mensaje, String titulo 
  ,{Color backgroundColorCustom = const Color.fromARGB(255, 209, 60, 184)}) {
    Flushbar(
      title: titulo,
      titleColor: Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      message: mensaje,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: backgroundColorCustom,
      boxShadows: const [
        BoxShadow(
            color: Color.fromARGB(255, 48, 112, 186),
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0)
      ],
      backgroundGradient:
           LinearGradient(colors: [backgroundColorCustom, Color.fromARGB(255, 88, 12, 98)]),
      isDismissible: false,
      duration: const Duration(seconds: 4),
    ).show(context);
  }

 static const List<String> img = [
  "https://media.discordapp.net/attachments/952802458399297576/977799908977430568/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977800227044093982/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977801469183025178/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977802283167399936/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977801782652715018/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977802738324889670/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977802960056774656/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977803364911947796/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977803728373563472/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977804032791945266/unknown.png",
  "https://media.discordapp.net/attachments/952802458399297576/977804506542792714/unknown.png"
];

 static const List<String> imgList = [
  'https://media.discordapp.net/attachments/952802458399297576/977977109580509194/unknown.png',
  'https://media.discordapp.net/attachments/952802458399297576/977977717431631882/unknown.png',
  'https://media.discordapp.net/attachments/952802458399297576/977978985797550120/unknown.png',
  'https://media.discordapp.net/attachments/952802458399297576/977979930245738536/unknown.png?width=663&height=663',
  'https://media.discordapp.net/attachments/952802458399297576/977980354872873010/unknown.png',
  'https://media.discordapp.net/attachments/952802458399297576/977978423534293022/unknown.png'
];

static final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: InkWell(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ))
    .toList();


    
}