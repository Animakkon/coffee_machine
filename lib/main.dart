import 'package:coffee_machine/pages/addResources.dart';
import 'package:coffee_machine/pages/coffeeMaker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //todo: push
  //todo: second page
  //todo: 2 big labs
  //todo: вынести объявление класса машины сюда
  //todo:

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Coffee Mashine'),
              automaticallyImplyLeading: false,
              bottom:
                 const TabBar(
                      indicatorColor: Colors.grey,
                      tabs: [
                Tab(
                  icon: Image(image: AssetImage("assets/icons/coffeeCup.png"), width: 30, height: 30,),
                ),
                Tab(
                  icon: Image(image: AssetImage("assets/icons/resources.png"), width: 30, height: 30,),
                )
              ]),
            ),
            body: const TabBarView(
              children: [
                CoffeeMaker(),
                AddResources()
              ],
            ),
          ),
        )
        // const MyHomePage(),
        );
  }
}