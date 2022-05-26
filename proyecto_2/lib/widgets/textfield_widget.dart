import 'package:proyecto_2/shared/responsive.dart';
import 'package:proyecto_2/utils/global.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? isSuffixIcon;
  final bool? isPrefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? otherColor;
  final Color? color;
  final int? maxlong;
  final void Function()? onsuffixIconTap;
  final bool? isMaxlong;
  final bool? isfilled;
  final TextEditingController? controller;
  final bool? isMyControllerActivate;

  const TextFieldWidget(
      {Key? key,
      this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.onChanged,
      this.obscureText = false,
      this.isSuffixIcon = false,
      this.isPrefixIcon = false,
      this.onTap,
      this.readOnly = false,
      this.otherColor = false,
      this.color = const Color.fromARGB(255, 231, 161, 254) ,
      this.maxlong,
      this.onsuffixIconTap,
      this.isMaxlong = false,
      this.isfilled = false,
      this.controller,
      this.isMyControllerActivate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeField = 0;
    if (isTab(context) || isDesktop(context)) {
      fontSizeField = 20;
    } else if (isMobile(context)) {
      fontSizeField = 14;
    }
    return TextFormField(
      maxLength: isMaxlong == false ? null : maxlong,
      controller: isMyControllerActivate == false ? null : controller,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly!,
      obscureText: obscureText!,
      cursorColor: color,
      style: TextStyle(
        color: color,
        fontSize: fontSizeField,
      ),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: color),
          focusColor: color,
          filled: isfilled,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: color!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: color!)),
          labelText: hintText,
          prefixIcon: isPrefixIcon == false
              ? null
              : Icon(
                  prefixIconData,
                  size: 30,
                  color: color,
                ),
          suffixIcon: isSuffixIcon == false
              ? null
              : GestureDetector(
                  onTap: onsuffixIconTap,
                  child: Icon(
                    suffixIconData,
                    size: 25,
                    color: color,
                  ))),
    );
  }
}
