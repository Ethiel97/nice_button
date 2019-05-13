import 'package:flutter/material.dart';

@immutable
class NiceButtonBuilder extends StatelessWidget {
  /// This is a builder class for a nice button
  ///
  /// Icon can be used to define the button design
  /// User can use Flutter built-in Icons or font-awesome flutter's Icon  final bool mini;
  final IconData icon;

  /// radius can be used to specify the button border radius
  final double radius;

  /// List of gradient colors to define the gradients
  final List<Color> gradientColors;

  /// This is the button's text
  final String text;

  /// This is the color of the button's text
  final Color textColor;

  /// User can define the background color of the button
  final Color background;

  /// User can define the width of the button
  final double width;

  /// Here user can define what to do when the button is clicked or pressed
  final Function onPressed;

  /// This is the elevation of the button
  final double elevation;

  /// This is the padding of the button
  final EdgeInsets padding;

  /// `mini` tag is used to switch from a full-width button to small button
  final bool mini;

  const NiceButtonBuilder(
      {Key key,
      this.mini = false,
      this.radius = 4.0,
      this.elevation = 3.0,
      this.textColor = Colors.white,
      this.width = null,
      this.padding = const EdgeInsets.all(15.0),
      @required this.onPressed,
      @required this.text,
      @required this.background,
      this.gradientColors = const [],
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      key: key,
      elevation: elevation,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
          onTap: onPressed,
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(40.0),
                  gradient: gradientColors.length > 0
                      ? LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.topRight)
                      : LinearGradient(colors: [background])),
              padding: padding,
              child: mini
                  ? Container(
                      width: 35.0,
                      height: 35.0,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      constraints: BoxConstraints(
                        maxWidth:
                            width ?? MediaQuery.of(context).size.width / 1.5,
                      ),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 20),
                              child: Icon(
                                icon,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: textColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ))),
    );
  }
}
