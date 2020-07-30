import 'package:flutter/material.dart';
import 'package:notes/main.dart';

class FeaturedDetails extends StatefulWidget {
  String image;
  String title;
  String imageTag;

  FeaturedDetails({this.image, this.title, this.imageTag});

  @override
  _FeaturedDetailsState createState() => _FeaturedDetailsState();
}

class _FeaturedDetailsState extends State<FeaturedDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkMode ? Colors.black : Colors.white,
      child: Container(
        child: Stack(
          children: [
            Hero(
              tag: widget.imageTag,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                  //height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,

                  child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 5,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$55.00",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  child: Icon(Icons.favorite),
                                  backgroundColor:
                                      darkMode ? Colors.white : Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "This is going to be the image description that will be sent from the home screen. "
                              "It is intentionally being made longer to test how it will be when the details is actually long. "
                              "Y'know, just in case."
                                  "This is going to be the image description that will be sent from the home screen. "
                                  "It is intentionally being made longer to test how it will be when the details is actually long. "
                                  "Y'know, just in case."
                                  "This is going to be the image description that will be sent from the home screen. "
                                  "It is intentionally being made longer to test how it will be when the details is actually long. "
                                  "Y'know, just in case.",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 30,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red
                        ),

                        child: Text("Calculate", style: TextStyle(fontSize: 22),),
                      ),
                      SizedBox(
                        height: 30,),
                      ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
