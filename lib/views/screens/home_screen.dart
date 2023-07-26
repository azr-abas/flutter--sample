import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_login/controller/home_controller.dart';
import 'package:new_login/main.dart';
import 'package:new_login/models/product.dart';
import 'package:new_login/models/user.dart';
import 'package:new_login/views/screens/description.dart';
import 'package:new_login/views/screens/new_screen.dart';

import '../../controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => NewScreen())));
              },
              icon: Icon(Icons.person))
        ],
        title: Text('Welcome to the Home Screen !'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  autoPlayInterval: Duration(seconds: 3),
                  height: 200.0,
                ),
                items: c.mystore.map((i) {
                  return Container(
                    // width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network('${i.urlImage}', fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Text('Categories : ',
              style: TextStyle(
                fontSize: 25,
              )),
          Expanded(
              child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: c.mystore.length,
            itemBuilder: (context, index) {
              productItems myObj = c.mystore[index];
              return InkWell(
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    // margin: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(padding: EdgeInsets.all(8)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 110,
                            width: 100,
                            child: Image.network(
                              '${myObj.urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text('${myObj.name}'),
                      ],
                    ),
                  ),
                  onTap: () => Get.to(() => DescriptionPage(c.mystore[index])));
            },
          )),
          Text('New Arrival :',
              style: TextStyle(
                fontSize: 25,
              )),
          Expanded(
              child: GridView.builder(
            controller: ScrollController(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: c.mystore.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(() => DescriptionPage(c.mystore[index])),
                child: Card(
                  surfaceTintColor: Colors.transparent,
                  child: Container(
                      // padding: EdgeInsets.all(8),
                      child: Column(
                    children: [
                      // Padding(padding: EdgeInsets.all(10)),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.network('${c.mystore[index].urlImage}',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('${c.mystore[index].name}')),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('${c.mystore[index].price}'))
                    ],
                  )),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
