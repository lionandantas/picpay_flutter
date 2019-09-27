import 'package:flutter/material.dart';

class PicPayBottomAppBarItem {
  PicPayBottomAppBarItem(
      {this.iconData, this.text, this.notification, this.counter = 0});
  IconData iconData;
  String text;
  bool notification;
  int counter;
}

class PicPayBottomAppBar extends StatefulWidget {
  PicPayBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<PicPayBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => PicPayBottomAppBarState();
}

class PicPayBottomAppBarState extends State<PicPayBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color, fontFamily: 'Robo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    PicPayBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: item.notification
                ? Stack(
                    children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(item.iconData,
                                  color: color, size: widget.iconSize),
                              Text(
                                item.text,
                                style:
                                    TextStyle(color: color, fontFamily: 'Robo'),
                              ),
                            ],
                          )),
                      item.counter != 0
                          ? new Positioned(
                              right: 20,
                              top: 5,
                              child: new Container(
                                padding: EdgeInsets.all(1),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 15,
                                  minHeight: 15,
                                ),
                                child: new Text(
                                  item.counter.toString(),
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : new Container()
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(item.iconData, color: color, size: widget.iconSize),
                      Text(
                        item.text,
                        style: TextStyle(color: color, fontFamily: 'Robo'),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
