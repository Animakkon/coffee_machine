import 'package:coffee_machine/classes/Machine.dart';
import 'package:flutter/material.dart';

class AddResources extends StatefulWidget {
  const AddResources({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddResource();
}

class _AddResource extends State<AddResources> {
  final GlobalKey<FormState> _milk = GlobalKey<FormState>();
  final GlobalKey<FormState> _water = GlobalKey<FormState>();
  final GlobalKey<FormState> _beans = GlobalKey<FormState>();
  final GlobalKey<FormState> _cash = GlobalKey<FormState>();

  final TextEditingController milkController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController beansController = TextEditingController();
  final TextEditingController cashController = TextEditingController();

  Machine machine = Machine();

  //todo: add button reset for resources
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          color: Colors.lime,
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(6),
            color: Colors.white60,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // todo: text at center
                  RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                        text: "Resources:\n\n",
                        style: const TextStyle(
                            fontSize: 30, color: Colors.black, wordSpacing: 2),
                        children: <InlineSpan>[
                          TextSpan(
                              text:
                                  'Milk: ${machine.getResources().getMilk()}\n'
                                  'Water: ${machine.getResources().getWater()}\n'
                                  'Beans: ${machine.getResources().getBeans()}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Cash: ${machine.getResources().getCash()}',
                        style:
                        const TextStyle(fontSize: 25, color: Colors.black54)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset.zero,
              )
            ]
          ),
          //todo: form controls
          child: Column(

          ),
        ),
      ],
    );
  }
}
