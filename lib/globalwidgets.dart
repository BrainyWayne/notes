import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notes/main.dart';
import 'package:notes/screens/menu.dart';

Widget appBar(String title, String title2, IconData icon1, IconData icon2,
    Widget widget, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: darkMode ? Colors.black : Colors.white,
    ),
    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    child: SafeArea(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    builder: (context, scrollController) => Material(child: widget),
                  );
                },
                  child: Icon(
                icon1,
                size: 20,
              )),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontFamily: "nunitobold", color: colorBig),
                  ),
                  Text(
                    title2,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colorBottom,
                        fontFamily: "nunitobold"),
                  ),
                ],
              ),
              Icon(
                icon2,
                size: 20,
              )
            ],
          ),
        ],
      ),
    ),
  );
}
