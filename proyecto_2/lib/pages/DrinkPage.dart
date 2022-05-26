import 'package:proyecto_2/Services/DrinkServices.dart';
import 'package:proyecto_2/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proyecto_2/pages/DrinkCategory.dart';



class DrinkPage extends StatelessWidget {

  DrinksServices drinksServices = DrinksServices();
  bool cargando = true;

  final String? user;
  DrinkPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
           children:[ 
               Padding(
             padding:  EdgeInsets.fromLTRB(20, 30, 40, 20),
             child: Container(
               child: Text("Welcome ${(user)}" ,
               textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25),),
             ),
           ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: Global.imageSliders,
        ),
             ),
           Padding(
             padding:  EdgeInsets.fromLTRB(20, 10, 250, 20),
             child: Container(
               child:const Text("Category",
               textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25),),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Container(
               height: 200.0,
               child: FutureBuilder(
                     future: drinksServices.obtainCategories(),
                     builder: (BuildContext context, AsyncSnapshot snapshot){

                       if(!snapshot.hasData){
                         return const Center(
                          child: Text('Cargando...'),
                         );
                       }

                       return ListView.builder(
                           itemCount: snapshot.data.length,
                           scrollDirection: Axis.horizontal,
                           shrinkWrap: true,
                           itemExtent: 100.0,
                           itemBuilder: (BuildContext context, int index){
                             return
                             
                              Padding(
                            padding: const EdgeInsets.all(10.0),
                          child: Column(
                           children: [
                              ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: 
                                (context) => DrinkCategoryPage(drinks: snapshot.data[index].strCategory,)));
                           },
                              child: Image.network(Global.img[index],
                              width: 70,
                              height: 70,
                               ),
                            ),
                          ),
                           Padding(
                            padding:  EdgeInsets.fromLTRB(0, 7, 0, 70),
                            child:  Text(snapshot.data[index].strCategory,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),),
                            
                          )
                           ],
                         ),
                         );
                           }
                       );
                     },
               ),
             ),
           ),
            Padding(
             padding:  EdgeInsets.fromLTRB(20, 0, 250, 20),
             child: Container(
               child:const Text("About Us",
               textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25),),
             ),
           ),
           Padding(
             padding:  EdgeInsets.fromLTRB(25, 15, 20, 30),
             child: Container(
               child:const Text("We are a recipe app for alcoholic and non-alcoholic beverages, here you can enjoy our wonderful recipes and you can even download them to your mobile device.",
               textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 15),),
             ),
           ),
         ],),  
      );
   
  }

  
}