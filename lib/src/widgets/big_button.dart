import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigButton extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BigButton({@required this.icon, @required this.texto, @required this.onPress, this.color1, this.color2});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BigButtonBackground(color1,color2,icon),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40,),
              FaIcon(icon, size: 40, color: Colors.white,),
              SizedBox(width: 20,),
              Expanded(child: Text(texto, style: TextStyle(fontSize: 18, color: Colors.white),)),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
              SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _BigButtonBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  final IconData icon;

  const _BigButtonBackground(this.color1, this.color2, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            (color1 != null) ? color1 : Colors.blueGrey,
            (color2 != null) ? color2 : Colors.grey,
          ]
        )
      ),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
