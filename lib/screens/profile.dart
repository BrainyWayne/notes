import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              StaggeredGridView.countBuilder(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 4,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) =>
                    index == 0 ? profileAvatar() : itemList(index),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileAvatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.asset(
            "assets/images/img0.jpg",
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Francis Eshun",
          style: TextStyle(fontFamily: 'modudlusbold', fontSize: 20),
        )
      ],
    );
  }

  Widget itemList(int index) {
    return Container(
        //padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.red),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: new Image.asset(
              "assets/images/img$index.jpg",
              fit: BoxFit.cover,
            )));
  }
}
