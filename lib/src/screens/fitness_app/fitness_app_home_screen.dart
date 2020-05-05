import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'bottom_navigation_view/models/tabIcon_data.dart';
import 'fitness_app_theme.dart';
import 'tab_screens/my_diary/my_diary_screen.dart';
import 'tab_screens/training/training_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.resetTabIconsList();

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: changeIndex,
        ),
      ],
    );
  }

  changeIndex(int index) {
    if (index == 0 || index == 2) {
      animationController.reverse().then<dynamic>((data) {
        if (!mounted) {
          return;
        }
        setState(() {
          tabBody = MyDiaryScreen(animationController: animationController);
        });
      });
    } else if (index == 1 || index == 3) {
      animationController.reverse().then<dynamic>((data) {
        if (!mounted) {
          return;
        }
        setState(() {
          tabBody = TrainingScreen(animationController: animationController);
        });
      });
    }
  }
}
