// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:emeraldchat_mobile/app/components/constants.dart';

class CheckBox extends StatefulWidget {
  bool val;
  CheckBox({Key? key, required this.val}) : super(key: key);

  @override
  State<CheckBox> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CheckBox> {  
  @override
  Widget build(BuildContext context) {
   
    return Checkbox(   
        activeColor: emeraldColor,     
        side: BorderSide(        
        color: Colors.white,      
      ),     
        value: widget.val,
        onChanged: (bool? value) {
          setState(() {
            widget.val = value!;
          });
        },
      );
  }
}

