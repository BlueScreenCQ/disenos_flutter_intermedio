import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: MiSlideshow()), //El expanded es necesario porque la columna no tiene ancho ni alto por defecto
        Expanded(child: MiSlideshow()),
      ],
    );
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        // bulletPrimario: 5,
        // bulletSecundario: 1,
        //puntosArriba: true,
        colorPrimario: Colors.red,
        colorSecundario: Colors.black12,
        slides: [
          SvgPicture.asset('assets/svg/1.svg'),
          SvgPicture.asset('assets/svg/2.svg'),
          SvgPicture.asset('assets/svg/3.svg'),
          SvgPicture.asset('assets/svg/4.svg'),
          SvgPicture.asset('assets/svg/5.svg'),
        ],
      ),
    );
  }
}
