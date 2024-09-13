import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/model/Intro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({super.key});

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  final _controller = PageController();
  bool _lastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              PrimaryColor,
              SubdarkColor,
              SubColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    if (value == 1) {
                      _lastpage = true;
                    } else {
                      _lastpage = false;
                    }
                  });
                },
                controller: _controller,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        IntroModel.IntroData(context)[index].path,
                        height: MediaQuery.of(context).size.width,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        IntroModel.IntroData(context)[index].PrimaryText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            fontFamily: PrimaryFont),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          IntroModel.IntroData(context)[index].SubText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: SubFont,
                            color: WhiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                    ],
                  );
                },
                itemCount: IntroModel.IntroData(context).length,
              ),
              _lastpage
                  ? Positioned(
                      bottom: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setBool("intro", true);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen,
                              (Route<dynamic> route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PrimaryColor,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 16, 50),
                          ),
                          child: Text(
                            S.of(context).intro_4,
                            style: const TextStyle(
                              color: SubColor,
                              fontFamily: SubFont,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: 7,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: IsArabic() ? 10 : 0,
                            left: IsArabic() ? 0 : 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                onDotClicked: (index) =>
                                    _controller.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                ),
                                controller: _controller,
                                count: IntroModel.IntroData(context).length,
                                effect: const JumpingDotEffect(
                                  dotHeight: 7,
                                  dotWidth: 7,
                                  activeDotColor: PrimaryColor,
                                  dotColor: WhiteColor,
                                ),
                              ),
                              Text(
                                S.of(context).intro_2,
                                style: const TextStyle(
                                  color: WhiteColor,
                                  fontFamily: PrimaryFont,
                                  fontSize: 15,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                },
                                icon: Icon(
                                  IsArabic()
                                      ? Iconsax.arrow_left
                                      : Iconsax.arrow_right_1,
                                  color: PrimaryColor,
                                  size: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              _lastpage
                  ? const Text("")
                  : Positioned(
                      top: 0,
                      left: IsArabic() ? 0 : null,
                      right: IsArabic() ? null : 0,
                      child: TextButton(
                        onPressed: () {
                          _controller.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Text(
                          S.of(context).intro_1,
                          style: const TextStyle(
                            fontFamily: SubFont,
                            fontSize: 18,
                            color: WhiteColor,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
