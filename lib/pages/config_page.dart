import 'package:ev_dashboard/widgets/action_button_circle_widget.dart';
import 'package:ev_dashboard/widgets/action_button_square_widget.dart';
import 'package:ev_dashboard/widgets/bottom_navigation_bar_widget.dart';
import 'package:ev_dashboard/widgets/control_center_car_view_widget.dart';
import 'package:ev_dashboard/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLocked = false;
  bool backTrunkOpen = false;
  bool frontTrunkOpen = false;
  bool isSentryModeOn = false;
  bool isCharging = false;
  bool isSeatSeatHeaterOn = false;
  bool isRearViewMirrorOpen = false;
  bool isFlashLightsOn = false;
  bool isAirConditioningOn = true;
  bool repair = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const SizedBox(height: 80),
                HeaderWidget(
                  title: 'Control Center',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ControlCenterCarViewWidget(),
                Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLocked = !isLocked;
                              });
                            },
                            child: ActionButtonCircle(
                              icon: isLocked
                                  ? Iconsax.lock
                                  : Iconsax.unlock4,
                              isActive: !isLocked,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSentryModeOn = !isSentryModeOn;
                              });
                            },
                            child: ActionButtonCircle(
                              icon: Iconsax.mirroring_screen4,
                              isActive: isSentryModeOn,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                backTrunkOpen = !backTrunkOpen;
                              });
                            },
                            child: ActionButtonCircle(
                              icon: Iconsax.folder_open4,
                              isActive: backTrunkOpen,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isCharging = !isCharging;
                              });
                            },
                            child: ActionButtonCircle(
                              icon: Iconsax.battery_charging4,
                              isActive: isCharging,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButtonSquareWidget(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 19, top: 22, bottom: 20, right: 18),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RotationTransition(
                                        turns: Tween(begin: 0.0, end: 1.0)
                                            .animate(_controller),
                                        child: FaIcon(FontAwesomeIcons.fan,
                                            color: Colors.white, size: 35),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isAirConditioningOn =
                                                !isAirConditioningOn;
                                          });
                                        },
                                        child: Icon(
                                          Iconsax.wind_24,
                                          color: isAirConditioningOn
                                              ? Colors.white
                                              : Colors.grey,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Outside',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.white.withOpacity(.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            '32°C',
                                            style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Inside',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.white.withOpacity(.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            '20°C',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: -.8),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFlashLightsOn = !isFlashLightsOn;
                                      });
                                    },
                                    child: ActionButtonCircle(
                                      icon: Iconsax.lamp_charge,
                                      isActive: isFlashLightsOn,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSeatSeatHeaterOn =
                                            !isSeatSeatHeaterOn;
                                      });
                                    },
                                    child: ActionButtonCircle(
                                      icon: Icons
                                          .airline_seat_recline_normal_outlined,
                                      isActive: isSeatSeatHeaterOn,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isRearViewMirrorOpen =
                                            !isRearViewMirrorOpen;
                                      });
                                    },
                                    child: ActionButtonCircle(
                                      icon: Iconsax.camera,
                                      isActive: isRearViewMirrorOpen,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        repair = !repair;
                                      });
                                    },
                                    child: ActionButtonCircle(
                                      icon: Iconsax.image,
                                      isActive: repair,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarWidget()
        ],
      ),
    );
  }
}
