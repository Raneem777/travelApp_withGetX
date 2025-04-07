import 'package:f1/controller/controller.dart';
import 'package:f1/model/travelModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.data});
  Datum data;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Full-screen background image
          Positioned.fill(
            child: Image.asset(
              widget.data.image,
              fit: BoxFit.cover,
            ),
          ),

          /// Row with back button & favorite button
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Fix layout
              children: [
                /// Back button
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),

                /// Favorite button
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),
          Positioned(
            top:MediaQuery.of(context).size.height*0.55,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    children: [
                      Text(widget.data.title,style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.star,color: Colors.amber,size: 20,),
                          SizedBox(width: 5,),
                          Text(widget.data.rating)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(widget.data.description),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),child: Center(child: Text("Book Now",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                    ),
                  )
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}
