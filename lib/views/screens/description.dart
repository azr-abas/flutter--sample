import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_login/models/product.dart';

import 'package:new_login/controller/home_controller.dart';

class DescriptionPage extends StatelessWidget {
  final productItems store;
  DescriptionPage(this.store);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description page'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(8)),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    store.urlImage,
                    fit: BoxFit.cover,
                    height: 1000,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      store.name,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                
                const Text(
                  'Description : ',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                Text(
                  store.ourDescription.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: OutlinedButton(
                    onPressed: () {}, child: Text('Add to cart'))),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy Now'),
                ))
          ],
        ),
      ),
    );
  }
}
