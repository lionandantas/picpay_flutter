import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picpay/config/picpayStyles.dart';

class PicPayTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController controller;
  const PicPayTabBar({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _PicPayTabBarState createState() => _PicPayTabBarState();
}

class _PicPayTabBarState extends State<PicPayTabBar> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {

      print("AQUI"+widget.controller.index.toString());

       print("AQUI  PRES"+ widget.controller.previousIndex.toString());
     
      setState(() {
          _currentIndex = widget.controller.index;
        });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: new BoxDecoration(
        color: PicpayStyles.picPayPresBar,
        //border: new Border.all(color: Colors.black),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              child: Text("Atividades"),
              padding: EdgeInsets.all(20.0),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 40.0,
                    //decoration: BoxDecoration(shape: BoxShape.circle),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: _currentIndex == 0
                            ? PicpayStyles.primaryColor
                            : PicpayStyles.picPayPresBar,
                        width: 2.0,
                      )),
                    ),
                    child: new Material(
                        child: new InkWell(
                            splashColor: PicpayStyles.primaryColor,
                            highlightColor: PicpayStyles.primaryColor,
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: new EdgeInsets.all(0.0),
                              padding: new EdgeInsets.all(0.0),
                              decoration: new BoxDecoration(
                                color: PicpayStyles.picPayPresBar,
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(1.0)),
                              ),
                              child: Center(
                                child: Text("Tods",
                                    style: TextStyle(
                                      color: PicpayStyles.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    )),
                              ),
                            ))),
                  ))),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 40.0,
                  //decoration: BoxDecoration(shape: BoxShape.circle),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: _currentIndex == 1
                          ? PicpayStyles.primaryColor
                          : PicpayStyles.picPayPresBar,
                      width: 2.0,
                    )),
                  ),
                  child: new Material(
                      child: new InkWell(
                          splashColor: PicpayStyles.primaryColor,
                          highlightColor: PicpayStyles.primaryColor,
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: new EdgeInsets.all(0.0),
                            padding: new EdgeInsets.all(0.0),
                            decoration: new BoxDecoration(
                              color: PicpayStyles.picPayPresBar,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(1.0)),
                            ),
                            child: Center(
                              child: Text("Minhas",
                                  style: TextStyle(
                                    color: PicpayStyles.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  )),
                            ),
                          ))),
                )),
          ),
        ],
      ),
    );
    /*Container(
      decoration: new BoxDecoration(
        color: Colors.redAccent,
        border: new Border.all(color: Colors.black),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ///Left Column Title
          new Column(
            children: <Widget>[
              new Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "asdasd",
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          ),

          ///Right Column Title
          new Column(
            children: <Widget>[
              new Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "asdasd",
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          ),
        ],
      ),
    );*/
  }
}

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, kToolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

class WAppBar extends StatefulWidget implements PreferredSizeWidget {
  WAppBar({
    Key key,
    this.child, //自定义 widget  删除其他多余的wigdet
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : assert(elevation == null || elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final Widget child;

  final PreferredSizeWidget bottom;

  final double elevation;

  final ShapeBorder shape;

  final Color backgroundColor;

  final Brightness brightness;

  final IconThemeData iconTheme;

  final IconThemeData actionsIconTheme;

  final TextTheme textTheme;

  final bool primary;

  final bool centerTitle;

  final double titleSpacing;

  final double toolbarOpacity;

  final double bottomOpacity;

  @override
  final Size preferredSize;

  @override
  _WAppBarState createState() => _WAppBarState();
}

class _WAppBarState extends State<WAppBar> {
  static const double _defaultElevation = 0.0;
  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    IconThemeData overallIconTheme =
        widget.iconTheme ?? appBarTheme.iconTheme ?? themeData.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        overallIconTheme;
    TextStyle centerStyle = widget.textTheme?.title ??
        appBarTheme.textTheme?.title ??
        themeData.primaryTextTheme.title;
    TextStyle sideStyle = widget.textTheme?.body1 ??
        appBarTheme.textTheme?.body1 ??
        themeData.primaryTextTheme.body1;
    print(sideStyle);
    if (widget.toolbarOpacity != 1.0) {
      final double opacity =
          const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
              .transform(widget.toolbarOpacity);
      if (centerStyle?.color != null)
        centerStyle =
            centerStyle.copyWith(color: centerStyle.color.withOpacity(opacity));
      if (sideStyle?.color != null)
        sideStyle =
            sideStyle.copyWith(color: sideStyle.color.withOpacity(opacity));
      overallIconTheme = overallIconTheme.copyWith(
          opacity: opacity * (overallIconTheme.opacity ?? 1.0));
      actionsIconTheme = actionsIconTheme.copyWith(
          opacity: opacity * (actionsIconTheme.opacity ?? 1.0));
    }

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle,
//            child: toolbar,
            child: widget.child,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          widget.bottomOpacity == 1.0
              ? widget.bottom
              : Opacity(
                  opacity:
                      const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
                          .transform(widget.bottomOpacity),
                  child: widget.bottom,
                ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    final Brightness brightness = widget.brightness ??
        appBarTheme.brightness ??
        themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.backgroundColor ??
              appBarTheme.color ??
              themeData.primaryColor,
          elevation:
              widget.elevation ?? appBarTheme.elevation ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}
