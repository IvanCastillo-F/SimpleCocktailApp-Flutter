import 'package:proyecto_2/Services/DrinkServices.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:proyecto_2/widgets/button_widget.dart';
import 'package:proyecto_2/utils/global.dart';



class DrinkDetailPage extends StatelessWidget {

  DrinksServices drinksServices = DrinksServices();
  final String? drink;

  DrinkDetailPage({this.drink});
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child: FutureBuilder(
           future: drinksServices.obtainDrinksbyId(drink),
           builder: (BuildContext context, AsyncSnapshot snapshot){

             if(!snapshot.hasData){
               return const Center(
                child: Text('Cargando...'),
               );
             }

           

             return ListView.builder(
                 itemCount: snapshot.data.length,
                 itemBuilder: (BuildContext context, int index){

                   return Column(
                     children: [
                       //Name of the drink
                       Padding(
             padding:  EdgeInsets.fromLTRB(10, 20, 10, 30),
             child: Container(
               child:Text(snapshot.data[index].strDrink,
               textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30),),
             ),
           ),
           //Image
               ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(snapshot.data[index].strDrinkThumb,
                      width: 300,
                      height: 300,),
                    ),
                        Padding(
             padding:  EdgeInsets.fromLTRB(10, 20, 210, 30),
             child: Container(
               child:Center(
                 child: Text("Ingredients:",
                 textAlign: TextAlign.left,
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
               ),
             ),
             ),
                   Padding(
             padding:  EdgeInsets.fromLTRB(40, 0, 40, 40),
             child: Container(
               child:Text(snapshot.data[index].strIngredient1.toString() + ", " + 
               snapshot.data[index].strIngredient2.toString() + ", " + 
               snapshot.data[index].strIngredient3.toString() + ", " + 
               snapshot.data[index].strIngredient4.toString() + ", " + 
               snapshot.data[index].strIngredient5.toString(),
               textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 15),),
             ),
             ),  
             Padding(
             padding:  EdgeInsets.fromLTRB(10, 0, 210, 30),
             child: Container(
               child:Text("Instructions:",
               textAlign: TextAlign.left,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
             ),
             ),
              Padding(
             padding:  EdgeInsets.fromLTRB(45, 0, 20, 40),
             child: Container(
               child:Text(snapshot.data[index].strInstructions,
               textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 15),),
             ),
             ),
              FadeInLeft(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ButtonWidget(
                        tittle: 'Save Recipe',
                        hasColor: false,
                        width: 200,
                        height: 40,
                        onPressed: () {
                            Global.mensaje(context,'This recipe is now in your device', 'Saved');
                            return;
                        }
                  
                      ),
                    ),
                  ),
           
                     ],
                   );
                 }
             );
           },
         ),
      ),
    );
  }
}