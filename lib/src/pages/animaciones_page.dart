import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadFadeOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rotacion = Tween(begin: 0.0, end: 2.0*math.pi,).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate( //En base a porcentajes sobre la duración total de la animación
        CurvedAnimation(parent: controller, curve: Interval(0,0.25, curve: Curves.easeOut))
    );

    opacidadFadeOut= Tween(begin: 1.0, end: 0.1).animate( //En base a porcentajes sobre la duración total de la animación
        CurvedAnimation(parent: controller, curve: Interval(0.75, 1, curve: Curves.easeOut))
    );
    
    moverDerecha= Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));

    agrandar= Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {

      //print('status ${controller.status}');
      if(controller.status == AnimationStatus.completed) {
        controller.reverse();
        //controller.reset();
        //controller.repeat();
      }
      else if(controller.status == AnimationStatus.dismissed){
        controller.forward();
      }

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Play
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child){
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value, //  opacity: opacidad.value-opacidadOut.value  // el in y e out en la misma línea
              child: Transform.scale(
                scale: agrandar.value,
                child: Opacity(
                  opacity: opacidadFadeOut.value,
                  child: _Rectangulo()
                )
              ),
            ),
          ),
        );
      },
    );
  }
}





class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.blue
      ),
    );
  }
}
