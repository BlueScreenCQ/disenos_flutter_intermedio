import 'package:disenos/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Crea la instancia del Provider que es accesible desde este punto hacía abajo
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded( //Utiliza todo el esacio posible
                child: _Slides()
              ),
              _Dots()
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      width: 12,
      height: 12,
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5 )
                ? Color(0xff083bb0)
                : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {

    pageViewController.addListener(() {

      print('Página actual: ${pageViewController.page}');
      //Actualizar el provider - SliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;

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
        children: [
          _Slide(svg: 'assets/svg/4.svg'),
          _Slide(svg: 'assets/svg/3.svg'),
          _Slide(svg: 'assets/svg/2.svg')
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child:  SvgPicture.asset(svg),
    );
  }
}

