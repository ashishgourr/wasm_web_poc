import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/screen_offset.dart';
import 'footer.dart';
import 'header.dart';
import 'order.dart';
import 'menu.dart';

import 'payment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double verticalSpacing = constraints.maxWidth < 600 ? 50 : 100;
          return Column(
            children: [
              const Header(),
              SizedBox(
                height: verticalSpacing,
              ),
              const Menu(),
              SizedBox(
                height: verticalSpacing,
              ),
              const Payment(),
              SizedBox(
                height: verticalSpacing,
              ),
              const Order(),
              SizedBox(
                height: verticalSpacing * 2,
              ),
              const Footer(),
            ],
          );
        },
      ),
    );
  }
}
