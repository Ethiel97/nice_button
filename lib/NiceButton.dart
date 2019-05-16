import 'package:flutter/material.dart';

@immutable
class NiceButton extends StatelessWidget {
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

  /// `mini` tag is used to switch from a full-width button to a small button
  final bool mini;

  const NiceButton (
      {Key key,
      this.mini = false,
      this.radius = 4.0,
      this.elevation = 1.8,
      this.textColor = Colors.white,
      this.width,
      this.padding = const EdgeInsets.all(12.0),
      @required this.onPressed,
      @required this.text,
      @required this.background,
      this.gradientColors = const [],
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: onPressed,
      child: Material(
        color: Colors.transparent,
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(radius),
        key: key,
        elevation: elevation,
        child: mini
            ? Container(
                decoration: BoxDecoration(
                    gradient: gradientColors.length > 0
                        ? LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.topRight)
                        : LinearGradient(colors: [background, background]),
                    borderRadius: BorderRadius.circular(radius),
                    color: background),
                width: 65.0,
                height: 65.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              )
            : Container(
                padding: padding,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(radius),
                    gradient: gradientColors.length > 0
                        ? LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.topRight)
                        : LinearGradient(colors: [background, background])),
                constraints: BoxConstraints(
                  maxWidth: width ?? MediaQuery.of(context).size.width / 1.5,
                  // maxWidth: MediaQuery.of(context).size.width / 1.2
                ),
                child: Center(
                  child: icon == null
                      ? Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: textColor,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: textColor,
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              icon,
                              color: Colors.white,
                            ),
                          ],
                        ),
                ),
              ),
      ),
    );
  }
}
