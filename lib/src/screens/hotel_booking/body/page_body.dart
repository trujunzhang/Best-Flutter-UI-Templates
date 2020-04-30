import 'package:best_flutter_ui_templates/src/screens/hotel_booking/model/hotel_list_data.dart';
import 'package:flutter/material.dart';

import '../hotel_app_theme.dart';
import 'hotel_list_view.dart';

class PageBody extends StatefulWidget {
  PageBody({Key key, this.animationController, this.hotelList})
      : super(key: key);

  AnimationController animationController;
  List<HotelListData> hotelList;

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        child: ListView.builder(
          itemCount: widget.hotelList.length,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final int count = widget.hotelList.length;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn)));
            widget.animationController.forward();
            return HotelListView(
              callback: () {},
              hotelData: widget.hotelList[index],
              animation: animation,
              animationController: widget.animationController,
            );
          },
        ),
      ),
    );
  }
}
