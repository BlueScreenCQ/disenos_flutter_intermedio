import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon});
}


class PinterestMenu extends StatelessWidget {

  final bool mostrar;

  final Color backgroundColor; //white
  final Color activeColor; //black
  final Color secondaryColor; //blueGrey
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar=true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.secondaryColor = Colors.blueGrey,
    @required this.items
});

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_chart'); }),
  //   PinterestButton(icon: Icons.search, onPressed: () { print('Icon search'); }),
  //   PinterestButton(icon: Icons.notifications, onPressed: () { print('Icon notifications'); }),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('Icon supervised_user_circle'); }),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context){

            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).secondaryColor = secondaryColor;

            return _PinterestManuBackground(
              child:_MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestManuBackground extends StatelessWidget {

  final Widget child;

  _PinterestManuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 220,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: backgroundColor,
            //offset: Offset(10,10),
            blurRadius: 10,
            spreadRadius: -5
          ),
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int i;
  final PinterestButton item;

  _PinterestMenuButton(this.i, this.item);

  @override
  Widget build(BuildContext context) {

    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;

    final Color activeColor = Provider.of<_MenuModel>(context).activeColor;
    final Color secondaryColor = Provider.of<_MenuModel>(context).secondaryColor;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSelected = i;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (i == itemSelected)
              ? 30
              : 25,
          color: (i == itemSelected)
              ? activeColor
              : secondaryColor
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSelected = 0;

  Color backgroundColor = Colors.white; //white
  Color activeColor = Colors.black; //black
  Color secondaryColor = Colors.blueGrey; //blueGrey


  int get itemSelected => this._itemSelected;

  set itemSelected (int index){
    this._itemSelected = index;
    notifyListeners();
  }
}


