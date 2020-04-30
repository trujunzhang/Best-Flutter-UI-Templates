import 'package:best_flutter_ui_templates/src/layout/app_theme.dart';
import 'package:flutter/material.dart';

class LoggedUser extends StatefulWidget {
  LoggedUser({Key key,
    this.iconAnimationController
  }) : super(key: key);

  final AnimationController iconAnimationController;
  @override
  _LoggedUserState createState() => _LoggedUserState();
}

class _LoggedUserState extends State<LoggedUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child:

       Container(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             AnimatedBuilder(
               animation: widget.iconAnimationController,
               builder: (BuildContext context, Widget child) {
                 return ScaleTransition(
                   scale: AlwaysStoppedAnimation<double>(
                       1.0 - (widget.iconAnimationController.value) * 0.2),
                   child: RotationTransition(
                     turns: AlwaysStoppedAnimation<double>(
                         Tween<double>(begin: 0.0, end: 24.0)
                             .animate(CurvedAnimation(
                             parent: widget.iconAnimationController,
                             curve: Curves.fastOutSlowIn))
                             .value /
                             360),
                     child: Container(
                       height: 120,
                       width: 120,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         boxShadow: <BoxShadow>[
                           BoxShadow(
                               color: AppTheme.grey.withOpacity(0.6),
                               offset: const Offset(2.0, 4.0),
                               blurRadius: 8),
                         ],
                       ),
                       child: ClipRRect(
                         borderRadius:
                         const BorderRadius.all(Radius.circular(60.0)),
                         child: Image.asset('assets/images/userImage.png'),
                       ),
                     ),
                   ),
                 );
               },
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8, left: 4),
               child: Text(
                 'Chris Hemsworth',
                 style: TextStyle(
                   fontWeight: FontWeight.w600,
                   color: AppTheme.grey,
                   fontSize: 18,
                 ),
               ),
             ),
           ],
         ),
       ),

    );
  }
}