import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vip_number_app/model/numberModel.dart';

import '../widget/square.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // final numberProvider =
        //     ChangeNotifierProvider((ref) => NumberProvider());
        final numberGetter = ref.watch(numberProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text("VIP Numbers"),
            actions: [
              IconButton(
                  onPressed: () {
                    context.push("/Search");
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          drawer: const Drawer(),
          body: ListView.builder(
            itemCount: numberGetter.getNumber.length,
            itemBuilder: (BuildContext context, int index) {
              return Square(
                index: index,
                price: numberGetter.getNumber[index].price,
                number: numberGetter.getNumber[index].number,
              );
            },
          ),
        );
      },
    );
  }
}
