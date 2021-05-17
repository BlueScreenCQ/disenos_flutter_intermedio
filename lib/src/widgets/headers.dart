import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab),
    );
  }
}

class HeaderBordeRedondeado extends StatelessWidget {
  const HeaderBordeRedondeado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(70),
            bottomRight:Radius.circular(70)
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    final path = new Path();

    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

    //Dibujar con el path y el lápiz
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    final path = new Path();

    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

    //Dibujar con el path y el lápiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    //path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPiko extends StatelessWidget {
  const HeaderPiko({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderPikoPainter(),
      ),
    );
  }
}

class _HeaderPikoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    final path = new Path();

    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

    //Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.25);
    path.lineTo(size.width*0.5,size.height*0.35);
    path.lineTo(size.width,size.height*0.25);
    path.lineTo(size.width,0);
    //path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    final path = new Path();

    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

    //Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.30);
    //path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.40, size.width, size.height*0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    final path = new Path();

    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

    //Dibujar con el path y el lápiz
    // path.lineTo(0, size.height*0.30);
    // //path.lineTo(size.width, size.height*0.25);
    // path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.30);
    // path.quadraticBezierTo(size.width*0.75, size.height*0.25, size.width, size.height*0.30);
    // path.lineTo(size.width, 0);

    path.moveTo(0, size.height*0.80);
    //path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.85, size.width*0.5, size.height*0.80);
    path.quadraticBezierTo(size.width*0.75, size.height*0.75, size.width, size.height*0.80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height*0.80);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
