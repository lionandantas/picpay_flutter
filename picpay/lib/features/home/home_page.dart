import 'package:flutter/material.dart';
import 'package:picpay/config/picpayStyles.dart';
import 'package:picpay/features/base/BaseView.dart';
import 'package:picpay/features/home/home_contract.dart';
import 'package:picpay/features/home/home_presenter.dart';
import 'package:picpay/models/User.dart';
import 'package:picpay/widgets/PicPayCircle.dart';
import 'package:picpay/widgets/PicPayTabBar.dart';

class HomePage extends BaseView<_HomePageState> {
  @override
  _HomePageState state() => new _HomePageState();
}

class _HomePageState extends BaseState<HomePresenter, HomePage>
    with TickerProviderStateMixin
    implements HomeContract {
  TabController controller;
  List<Widget> commentWidgets;
  @override
  void initState() {
    super.initState();
    commentWidgets = List<Widget>();
    presenter.doListUser();
  }

  @override
  Widget create(BuildContext context) {
    if (controller == null) {
      controller = new TabController(length: 2, vsync: this);
    }
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 280.0,
            backgroundColor: Color(0XFFF0F0F0),
            floating: true,
            pinned: true,
            snap: true,
            leading: Container(),
            bottom: PicPayTabBar(
              controller: controller,
            ),
            /* WAppBar(
                child: new Container(
              child: new Align(
                child: Text(
                  "我是大标题",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            )),*/
           /* new TabBar(
              controller: controller,
              indicatorColor: Color(0XFF1D4384),
              unselectedLabelColor: Color(0XFFAAAAAA),
              labelColor: Color(0XFF1D4384),
              labelPadding: EdgeInsets.only(right: 10.0, left: 10.0),
              tabs: [
                new Tab(
                  text: 'Todos',
                ),
                new Tab(
                  text: 'Minhas',
                ),
              ],
            ),*/
            flexibleSpace: new FlexibleSpaceBar(
              background: new Container(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      child: AppBar(
                        centerTitle: true,
                        backgroundColor: PicpayStyles.white,
                        leading: Icon(
                          Icons.code,
                          color: PicpayStyles.primaryColor,
                        ),
                        primary: false,
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Meu saldo',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14),
                            ),
                            Visibility(
                              visible: true,
                              child: Text(
                                'R\$ 9,91',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.verified_user,
                                color: PicpayStyles.primaryColor),
                            onPressed: () {},
                          )
                        ],
                      ),
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 0.0, bottom: 0.0),
                    ),
                    Padding(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20.0, bottom: 10.0),
                        decoration:
                            BoxDecoration(color: PicpayStyles.primaryColor),
                        child: Text(
                          'Sugestões para você',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1.0,
                              color: Colors.white,
                              fontFamily: "Roboto",
                              ),
                        ),
                        // color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 0.0, bottom: 0.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                          height: 120.0,
                          padding: const EdgeInsets.only(top: 0.0),
                          decoration:
                              BoxDecoration(color: PicpayStyles.primaryColor),
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              // _buildSearchUser(),
                              new Row(
                                children: commentWidgets,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),

              // title: new Text("Sliver App Bar"),
            ),
          ),
          new SliverFillRemaining(
              child: new TabBarView(
            controller: controller,
            children: <Widget>[Text("A"), Text("B")],
          )),
          /*new SliverFixedExtentList(
            itemExtent: 150.0,
            delegate:
                new SliverChildBuilderDelegate((context, index) => new ListTile(
                      title: new Text("List item $index"),
                    )),
          )*/
        ],
      ),
    );
  }

  _buildSearchUser() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/searchUser");
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 0.0, bottom: 00.0, left: 5.0, right: 5.0),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Column(
            children: <Widget>[
              Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      // Circle shape
                      shape: BoxShape.circle,
                      color: Colors.black12,
                      // The border you want
                      border: new Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      // The shadow you want
                    ),
                    child: CircleAvatar(
                      radius: 25.0,
                      child: Center(
                          child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/searchUser");
                              })),
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 35.0, 3.0, 2.0),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      /*decoration: BoxDecoration(
                    color: isOnline == true ? Colors.green : Colors.grey,
                    border: Border.all(
                      width: 4.0,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),*/
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Ver mais",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  onListUsers(List<User> users) {
    setState(() {
      users.forEach((value) {
        commentWidgets.add(_buildCircular(value));
      });
    });
  }

  _buildCircular(User record) {
    return GestureDetector(
        onTap: () {},
        child: new Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 00.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                PicPayCircle(
                  user: record,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            )));
  }
}

class CustomTab extends StatefulWidget {
  final Function(int) tabSelected;
  final List<String> items;

  const CustomTab({Key key, this.tabSelected, this.items}) : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  var categorySelected = 0;

  @override
  Widget build(BuildContext context) {
    return _getListCategory();
  }

  Widget _getListCategory() {
    ListView listCategory = new ListView.builder(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildCategoryItem(index);
        });

    return new Container(
      height: 50.0,
      child: listCategory,
      color: Colors.grey[200].withAlpha(200),
    );
  }

  Widget _buildCategoryItem(index) {
    return new InkWell(
      onTap: () {
        setSelectedItem(index);
        print("click");
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Material(
              elevation: 2.0,
              color: categorySelected == index ? Colors.black : Colors.grey,
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              child: new Container(
                padding: new EdgeInsets.only(
                    left: 12.0, top: 7.0, bottom: 7.0, right: 12.0),
                child: new Text(
                  widget.items[index],
                  style: new TextStyle(
                      color: categorySelected == index
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setSelectedItem(index) {
    if (index != categorySelected) {
      widget.tabSelected(index);
      setState(() {
        categorySelected = index;
      });
    }
  }
}
