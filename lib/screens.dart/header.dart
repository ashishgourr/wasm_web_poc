import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/text_reveal.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageReveal;
  late Animation<double> smallImageOpacity;
  late Animation<double> navbarOpacity;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
      reverseDuration: const Duration(milliseconds: 375),
    );

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    descriptionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut),
      ),
    );

    smallImageReveal = Tween<double>(begin: 180.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeOut),
      ),
    );

    smallImageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );

    navbarOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double textFontSize = screenWidth < 600 ? 40.0 : 65.0;
        double descriptionFontSize = screenWidth < 600 ? 16.0 : 22.0;
        double sidePadding = screenWidth * 0.05;
        double smallImageWidth = screenWidth < 600 ? 120.0 : 180.0;
        double imageRevealWidth = screenWidth < 600 ? 120.0 : 180.0;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          height: 920,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeTransition(
                          opacity: smallImageOpacity,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.network(
                              'https://seeklogo.com/images/C/coffee-shop-design-logo-FAF1C5B326-seeklogo.com.png',
                              fit: BoxFit.fill,
                              width: smallImageWidth,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextReveal(
                                  maxHeight: 90.0,
                                  controller: controller,
                                  textRevealAnimation: textRevealAnimation,
                                  textOpacityAnimation: textOpacityAnimation,
                                  child: Text(
                                    'Coffee Shop',
                                    style: GoogleFonts.quicksand(
                                      fontSize: textFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                FadeTransition(
                                  opacity: descriptionAnimation,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat. Sit autem rerum qui vitae dolores cum eveniet eveniet vel sunt sunt eum reiciendis rerum aut voluptatem minus.',
                                    style: GoogleFonts.quicksand(
                                      fontSize: descriptionFontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50.0),
                                FadeTransition(
                                  opacity: smallImageOpacity,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15.0,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    child: SizeTransition(
                                      sizeFactor: smallImageOpacity,
                                      axis: Axis.horizontal,
                                      axisAlignment: -1.0,
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.all(12.0),
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                              ),
                                              cursorColor: Colors.blue,
                                            ),
                                          ),
                                          Container(
                                            height: 49.0,
                                            width: 49.0,
                                            color: Colors.blue,
                                            child: const Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50.0),
                                Flexible(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 120.0,
                                        width: smallImageWidth,
                                        child: Stack(
                                          children: [
                                            FadeTransition(
                                              opacity: smallImageOpacity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1511920170033-f8396924c348?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                  fit: BoxFit.cover,
                                                  width: smallImageWidth,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 120.0,
                                              width: imageRevealWidth,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Flexible(
                                        child: FadeTransition(
                                          opacity: smallImageOpacity,
                                          child: Text(
                                            'Lorem ipsum dolor sit amet. Sit rerum reiciendis et tenetur fuga et aliquam numquam. Qui omnis assumenda et reiciendis dicta aut animi aliquid qui molestiae ipsum.',
                                            style: GoogleFonts.quicksand(
                                              fontSize: screenWidth < 600
                                                  ? 14.0
                                                  : 16.0,
                                              height: 1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (screenWidth >= 900) ...[
                    const SizedBox(width: 150.0),
                    const Expanded(
                      flex: 1,
                      child: FirstPageImage(),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 500.0,
                      child: FadeTransition(
                        opacity: navbarOpacity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 80.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  'Home',
                                  'About',
                                  'Offers',
                                  'Accounts'
                                ].map<Widget>((title) {
                                  return RotatedBox(
                                    quarterTurns: 1,
                                    child: Text(
                                      title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));

    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1507133750040-4a8f57021571?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 375), () {
            if (_controller.isDismissed) {
              _controller.forward();
            }
          });
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    height: 920.0,
                    width: double.infinity,
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: _animation.value,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
            child: child,
          );
        }
        return const SizedBox();
      },
    );
  }
}
