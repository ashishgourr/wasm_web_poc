import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/screen_offset.dart';
import '../widgets/text_reveal.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
      reverseDuration: const Duration(milliseconds: 375),
    );

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.40, curve: Curves.easeOut),
      ),
    );

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.30, 0.60, curve: Curves.easeOut),
      ),
    );

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 0.80, curve: Curves.easeOut),
      ),
    );

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.70, 1.0, curve: Curves.easeOut),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        return current.scrollOffsetValue > 2800;
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 2900) {
          controller.forward();
        } else {
          controller.reverse();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double horizontalPadding = screenWidth * 0.1;
            double textFontSize = screenWidth < 600 ? 25.0 : 45.0;
            double subTextFontSize = screenWidth < 600 ? 12.0 : 14.0;
            double verticalSpacing = constraints.maxWidth < 600 ? 12.0 : 30.0;

            return SingleChildScrollView(
              child: Container(
                height: 500.0,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            width: 400.0,
                            padding: const EdgeInsets.all(1.0),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1485808191679-5f86510681a2?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              fit: BoxFit.cover,
                            ),
                          ),
                          AnimatedBuilder(
                            animation: imageRevealAnimation,
                            builder: (context, child) {
                              return Container(
                                height: imageRevealAnimation.value,
                                width: double.infinity,
                                color: Colors.white,
                                alignment: const Alignment(0.0, -1.0),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.1),
                    Flexible(
                      flex: 3,
                      child: AnimatedBuilder(
                        animation: textRevealAnimation,
                        builder: (context, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextReveal(
                                controller: controller,
                                maxHeight: 55.0,
                                child: Text(
                                  'Order your Favourite Coffee',
                                  style: GoogleFonts.quicksand(
                                    fontSize: textFontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: verticalSpacing),
                              AnimatedBuilder(
                                animation: subTextOpacityAnimation,
                                builder: (context, child) {
                                  return FadeTransition(
                                    opacity: subTextOpacityAnimation,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                                      style: GoogleFonts.quicksand(
                                        fontSize: subTextFontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: verticalSpacing),
                              AnimatedBuilder(
                                animation: subTextOpacityAnimation,
                                builder: (context, child) {
                                  return FadeTransition(
                                    opacity: subTextOpacityAnimation,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
                                      style: GoogleFonts.quicksand(
                                        fontSize: subTextFontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: verticalSpacing),
                              Container(
                                alignment: const Alignment(0.0, -1.0),
                                height: 90.0,
                                child: AnimatedBuilder(
                                  animation: subImageRevealAnimation,
                                  builder: (context, child) {
                                    return SizedBox(
                                      height: subImageRevealAnimation.value,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              'https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 20.0),
                                          Expanded(
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //  SizedBox(width: screenWidth * 0.15),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
