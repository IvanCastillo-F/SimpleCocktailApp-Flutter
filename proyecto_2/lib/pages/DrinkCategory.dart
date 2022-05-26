import 'package:proyecto_2/Services/DrinkServices.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_2/pages/DrinkDetailPage.dart';



class DrinkCategoryPage extends StatelessWidget {

  DrinksServices drinksServices = DrinksServices();
  final String? drinks;

  DrinkCategoryPage({this.drinks});
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child: FutureBuilder(
           future: drinksServices.obtainbyCategory(drinks),
           builder: (BuildContext context, AsyncSnapshot snapshot){

             if(!snapshot.hasData){
               return const Center(
                child: Text('Cargando...'),
               );
             }

             return ListView.builder(
                 itemCount: snapshot.data.length,
                 itemBuilder: (BuildContext context, int index){
                   return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].strDrinkThumb
                        ),
                      ),
                     title: Text(snapshot.data[index].strDrink),
                    onTap: (){
                              Navigator.push(context, 
                              MaterialPageRoute(builder: 
                              (context) => DrinkDetailPage(drink: snapshot.data[index].idDrink,)));
                         },
                   );
                 }
             );
           },
         ),
      ),
    );
  }
}