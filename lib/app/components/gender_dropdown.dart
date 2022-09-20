// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:emeraldchat_mobile/app/components/constants.dart';

class RoundedDropDownButton extends StatefulWidget {
  const RoundedDropDownButton({Key? key}) : super(key: key);

  @override
  State<RoundedDropDownButton> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RoundedDropDownButton> {
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(  
          padding: EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,   
          decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(29),),        
          width: size.width * 0.4,
          child: ClipRRect(            
            borderRadius: BorderRadius.circular(29),
            child: DropdownButton<String>(
              value: dropdownValue,             
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
              underline: Container(
                height: 2,
                color: Colors.yellow,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Others']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
        ),
      ),
    );
  }
}

