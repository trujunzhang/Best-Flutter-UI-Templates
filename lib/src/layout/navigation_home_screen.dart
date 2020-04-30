import 'package:best_flutter_ui_templates/src/screens/home/home_screen.dart';
import 'package:best_flutter_ui_templates/src/layout/app_theme.dart';
import 'package:best_flutter_ui_templates/src/layout/custom_drawer/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/src/layout/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/src/layout/sidebar/feedback_screen.dart';
import 'package:best_flutter_ui_templates/src/layout/sidebar/help_screen.dart';
import 'package:best_flutter_ui_templates/src/layout/sidebar/invite_friend_screen.dart';
import 'package:best_flutter_ui_templates/src/screens/design_course/home_design_course.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    // screenView = HotelHomeScreen();
    // screenView = FitnessAppHomeScreen();
    // screenView = DesignCourseHomeScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
