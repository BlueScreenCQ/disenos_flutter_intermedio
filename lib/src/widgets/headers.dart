import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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

class HeaderWavesGradiente extends StatelessWidget {
  const HeaderWavesGradiente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderWavesGradientePainter(),
      ),
    );
  }
}

class _HeaderWavesGradientePainter extends CustomPainter{

  //Gradiente horizontal coordenada en y no influye
  final Rect rect = new Rect.fromCircle(
      center: Offset(55.0,0.0),
      radius: 180
  );

  final Gradient gradiente = new LinearGradient(
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ],
  stops: [
    0.2,
    0.5,
    1.0
  ]
  );


  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint().. shader = gradiente.createShader(rect);
    final path = new Path();

    //Propiedades
    //lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke; // .fill . stroke
    lapiz.style = PaintingStyle.fill; // .fill . stroke
    lapiz.strokeWidth = 2;

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


class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.color1,
    this.color2
  });

  @override
  Widget build(BuildContext context) {

    final Color blanco = Colors.white.withOpacity(0.7);


    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2
        ),

        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size:250, color: Colors.white.withOpacity(0.2))
        ),

        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitulo, style: TextStyle(fontSize: 20, color: blanco),),
            SizedBox(height: 20),
            Text(this.titulo, style: TextStyle(fontSize: 25, color: blanco, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            FaIcon(this.icon, size:80, color: Colors.white)


          ],
        )

      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    Key key, this.color1, this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            (color1 != null) ? color1 : Colors.blueGrey,
            (color2 != null) ? color2 : Colors.grey,
          ]
        )
      ),
    );
  }
}

