import 'package:disenos/src/labs/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {

              Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;
              Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;

              return Column(
                children: [
                  if (this.puntosArriba)
                    _Dots(this.slides.length),
                  Expanded( //Utiliza todo el esacio posible
                      child: _Slides( this.slides )
                  ),
                  if (!this.puntosArriba)
                    _Dots(this.slides.length),
                ],
              );
            },
          )
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int n;

  _Dots(this.n);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(n, (i) => _Dot(i)), // Función generadora. Pasa una función por cada elemento de la lista
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      width: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 ) ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      height: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 ) ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 )
              ? ssModel.colorPrimario
              : ssModel.colorSecundario,
          shape: BoxShape.circle
      ),
    );
  }
}

class SlideshowModel {
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map( (slide) => _Slide(slide) ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child:  slide,
    );
  }
}


class _SlideshowModel with ChangeNotifier{

  double _currentPage =0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecuendario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double value) {

    this._currentPage = value;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecuendario;

  set colorSecundario(Color color) {
    this._colorSecuendario = color;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario (double t){
    this._bulletPrimario = t;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario (double t){
    this._bulletSecundario = t;
  }
}
