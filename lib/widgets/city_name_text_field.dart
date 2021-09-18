import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitynameTextField extends StatelessWidget {
  CitynameTextField({
    Key? key,
    required this.formKey,
    required this.cityName,
    this.onChanged,
    this.onComplete,
    this.labelName
  }) : super(key: key);
  final formKey;
  final cityName;
  final onChanged;
  final onComplete;
  final labelName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySize.size54,
      child: Form(
        key: formKey,
        child: TextFormField(
          validator: (value) =>
              value!.isEmpty ? 'City name cannot be blank'.tr : null,
          controller: TextEditingController(
            text: cityName,
          ),
          style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w600
              ),
          cursorColor: Colors.deepPurple,
          decoration: InputDecoration(
              labelText: labelName,
              
              focusColor: Colors.deepPurple,
              fillColor: Colors.deepPurple,
              hoverColor: Colors.deepPurple,
              labelStyle: TextStyle(
                color: Colors.deepPurple[700],
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w900
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[350]!,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
              hintText: "Search a city / country",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              hintStyle: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w600
              ),),
          onChanged: onChanged,
          onEditingComplete: onComplete,
        ),
      ),
    );
  }
}
