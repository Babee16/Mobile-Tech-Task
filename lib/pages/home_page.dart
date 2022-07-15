import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtt/pages/qoutes_page.dart';
import 'package:mtt/pages/saved_qoutes_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../others/size_config.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var isLoading = false;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PersistentTabController? controller;

    List<Widget> _buildScreens() {
      return [
        const QoutesPage(),
        const SaveQuotesPage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(
            FontAwesomeIcons.home,
            // color: const Color.fromRGBO(0, 127, 124, 1),
            // size: SizeConfig.blockSizeVertical! * 4,
          ),
          title: "Home",
          activeColorPrimary: const Color.fromRGBO(0, 127, 124, 1),
          inactiveColorPrimary: Colors.teal[400],
          // inactiveColorSecondary:  const Color.fromRGBO(0, 127, 124, 1)[400],
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            FontAwesomeIcons.heart,
            // color: const Color.fromRGBO(0, 127, 124, 1),
            // size: SizeConfig.blockSizeVertical! * 4,
          ),
          title: "Favorites",
          activeColorPrimary: const Color.fromRGBO(0, 127, 124, 1),
          inactiveColorPrimary: Colors.teal[400],
          // inactiveColorSecondary:  const Color.fromRGBO(0, 127, 124, 1)[400],
        ),
      ];
    }

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          return await showDialog(
                context: context!,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Do you want to exit the App?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(false); //Will not exit the App
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Navigator.of(context).pop(true); //Will exit the App
                        },
                      )
                    ],
                  );
                },
              ) ??
              false;
        },
        selectedTabScreenContext: (context) {
          // var testContext = context;
        },
        hideNavigationBar: false,
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
          // borderRadius: BorderRadius.circular(20.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style13, // Choose the nav bar style with this property
      ),
    );
  }
}
