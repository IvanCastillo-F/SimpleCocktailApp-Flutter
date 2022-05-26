import 'package:flutter/material.dart';
import 'package:proyecto_2/widgets/button_widget.dart';
import 'package:proyecto_2/widgets/textfield_widget.dart';
import 'package:proyecto_2/utils/global.dart';
import 'package:proyecto_2/pages/DrinkPage.dart';

class LoginPage extends StatelessWidget {
 
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
              builder: (context) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          Padding(
                  padding: const EdgeInsets.fromLTRB(40, 55, 40, 40),
                   child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.person,
                          isMyControllerActivate: true,
                          controller: _controllerUser, onsuffixIconTap: () {
                            print('click');
                          },
                          hintText: 'Enter Your Username',
                        ),
                    ),
           Padding(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 80),
                   child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.lock,
                          isMyControllerActivate: true,
                          controller: _controllerPass, onsuffixIconTap: () {
                            print('click');
                          },
                          hintText: 'Enter Your Password',
                        ),
                    ),
                     Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                        child: ButtonWidget(
                          tittle: 'Login',
                          hasColor: false,
                          width: 200,
                          height: 40,
                          onPressed: () {
                              if(_controllerUser.text.isEmpty || _controllerPass.text.isEmpty){
                            Global.mensaje(context,'You must enter information in all fields', 'Validation');
                            return;
                          }else if(_controllerUser.text.length > 10){
                            Global.mensaje(context,'Username must be less than 10 characters', 'Too Long');
                            return;
                          }
                                Navigator.push(context, 
                                  MaterialPageRoute(builder: 
                                  (context) => DrinkPage(user:_controllerUser.text)));
                          }
                    
                        ),
                      ),
                       ],
                ));
              }
      ),
    );
  }
}