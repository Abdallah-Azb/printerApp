import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coustom_Text_Faild extends StatelessWidget {
  final String hintText;
  final IconData iconData;

  final Function OnSaved;

  final TextInputType keyboardType;

  const Coustom_Text_Faild({
    @required this.iconData,
    @required this.hintText,
    @required this.OnSaved,
    this.keyboardType,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        onSaved: OnSaved,
        maxLines: 3,
        minLines: 1,
        validator: (value) {
          if (value.isEmpty) {
            return "can't be empty".tr;
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.deepOrange[500]),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.deepOrange[900], width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.deepOrange[900], width: 2.0),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(
            iconData,
            color: Colors.deepOrange[900],
          ),
          hintText: hintText,
          hintMaxLines: 1,
        ),
      ),
    );
  }
}
