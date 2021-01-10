import 'package:shopitoo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String logo = 'images/icons/logo.svg';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // image: AssetImage('images/icons/logo.svg'),
            Center(
              child: SvgPicture.asset(
                logo,
                height: 20.0,
                width: 20.0,
              ),
            ),

            Positioned(
              bottom: 0,
              child: Text(
                'Shopitoo',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 26,
                  color: kSecondaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
