import 'dart:ui';

import 'package:f1/controller/controller.dart';
import 'package:f1/view/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index=0;
  Controller controller= Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: const Icon(Icons.menu,color: Colors.black,),
        ),
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
           Icon(Icons.location_on,color: Colors.red,),
            Text("New York, USA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: const Icon(Icons.search,color: Colors.black,),
        ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
            height: 200,
            //width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.model.data.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(data: controller.model.data[index])));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                     ),
                    child: Stack(
                      children: [
                   ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: Image.asset(controller.model.data[index].image,fit: BoxFit.cover,width: 150,)),
                    Positioned(child: Icon(Icons.favorite_border,color: Colors.white,),top: 10,right: 10,),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: Text(controller.model.data[index].title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                      ]
                     
                      
                    )
                  ),
                );
              },
            ),
          ),
          SizedBox(
            
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:controller.model.data.length ,
              itemBuilder: ((context, index) {
                return Container(
                 decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                    margin: const EdgeInsets.all(10),
                   child: Center(child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(controller.model.data[index].place,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                   ))
                );
              })),
          ),
          SizedBox(
            width: 500,
            height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.model.data.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: 500,
                      child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(data: controller.model.data[index])));
                          },
                          child: Image.asset(controller.model.data[index].image,fit: BoxFit.cover,))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                       Text(controller.model.data[index].title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), 
                       Spacer(),
                       Icon(Icons.more_vert_rounded)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 20,),
                        SizedBox(width: 5,),
                        Text(controller.model.data[index].rating)
                      ],
                    ),
                  )
                ],
              );
            }),
          )
        ],),
      ),
       bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: BottomNavigationBar(
          
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              
            iconSize: 35,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person,), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home
                  ),
                  label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined,), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: ""),
          
            ],
          ),
        ),
    );
  }
}