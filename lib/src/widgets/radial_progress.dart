import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({@required this.porcentaje, this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey, this.grosorSecundario = 4, this.grosorPrimario = 10});


  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                (widget.porcentaje-diferenciaAAnimar) + (diferenciaAAnimar * controller.value),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.grosorPrimario,
                widget.grosorSecundario
              ),
              child: Center(
                child: Text('${widget.porcentaje} %', style: TextStyle(color: widget.colorPrimario, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            )
        );
      }
    );
  }
}

class _MiRadialProgress extends CustomPainter{

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;


  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario, this.grosorPrimario, this.grosorSecundario);

  @override
  void paint(Canvas canvas, Size size) {

    //Circulo completo
    final lapiz = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final centro = new Offset(size.width*0.5, size.height*0.5);
    final radio = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(centro, radio, lapiz);

    //Arco
    final lapizArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //parte que se deberá ir lleando
    double arcAngle = 2 * pi * (porcentaje/100);
    canvas.drawArc(Rect.fromCircle(
        center: centro, radius: radio),
        -pi/2,
        arcAngle,
        false,
        lapizArco
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
