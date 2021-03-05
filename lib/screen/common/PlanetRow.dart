import 'package:flutter/material.dart';
import 'package:treva/model/Planet.dart';
import 'package:treva/screen/Detail/DetailPage.dart';
import 'package:treva/screen/common/Separator.dart';
import 'package:treva/screen/textStyle.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetRow(this.planet, {this.horizontal = true});
  PlanetRow.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "planet-hero-${planet.id}",
        child: Image(
          image: AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return Row(
        children: [
          Image.asset(image, height: 12.0),
          Container(width: 8.0),
          Text(
            value,
            style: Style.smallTextStyle,
          ),
        ],
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text(
            planet.name,
            style: Style.titleTextStyle,
          ),
          Container(height: 8.0),
          Text(
            planet.location,
            style: Style.commonTextStyle,
          ),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                    value: planet.distance,
                    image: 'assets/images/ic_distance.png'),
              ),
              Container(
                width: 32.0,
              ),
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                    value: planet.gravity,
                    image: 'assets/images/ic_gravity.png'),
              )
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: planetCardContent,
    );

    return GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailPage(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
