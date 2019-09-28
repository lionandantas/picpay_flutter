import 'package:flutter/material.dart';
import 'dart:ui';

class PicPayItemFeed extends StatelessWidget {
  final String nomeUsuario;
  final String situacao;
  final String nomeFantasia;
  final String quantidadeCurtidas;
  final bool curtir;
  final String dataPontuacao;
  final String imagem;
  final void Function() onPressedLike;
  final void Function() onPressedDesLike;
  final void Function() onPressed;

  PicPayItemFeed({
    this.nomeUsuario,
    this.situacao,
    this.nomeFantasia,
    this.quantidadeCurtidas,
    this.curtir,
    this.dataPontuacao,
    this.imagem,
    @required this.onPressedLike,
    @required this.onPressedDesLike,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: new Material(
          child: new InkWell(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.all(3.0),
              padding: new EdgeInsets.all(3.0),
              height: 150.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              child: Container(),
            ),
          ),
          color: Colors.transparent,
        ));

    /*@override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: new Material(
          child: new InkWell(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.all(3.0),
              padding: new EdgeInsets.all(3.0),
              height: 120.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                // boxShadow: [new BoxShadow(color: Colors.black54, offset: new Offset(2.0, 2.0),
                //   blurRadius: 5.0)]
              ),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  /* new CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                      radius: 30.0,
                    )*/
                  new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        // Circle shape
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // The border you want
                        border: new Border.all(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        // The shadow you want
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/images/user.png'),
                        image: NetworkImageWithRetry(
                          imagem,
                          scale: 0.85,
                        ),
                      ),
                    ),
                  ),
                  new Expanded(
                      child: new Padding(
                    padding: new EdgeInsets.only(left: 8.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Wrap(
                          spacing: 8.0,
                          // gap between adjacent chips
                          runSpacing: 4.0,
                          // gap between lines
                          direction: Axis.horizontal,
                          // main axis (rows or columns)
                          children: <Widget>[
                            Html(
                              data: "<b>" +
                                  nomeUsuario +
                                  "</b>" +
                                  " esteve em  <b>" +
                                  nomeFantasia +
                                  "</b>" +
                                  (situacao == "1"
                                      ? " e foi pontuado(a)."
                                      : " completou seu cartão."),
                              //Optional parameters:
                              padding: EdgeInsets.all(8.0),
                            ),
                            /* new Text(
                              nome_usuario,
                              style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              situacao == 1
                                  ? "foi pontuad(a)o por"
                                  : "completou seu cartão em",
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            new Text(
                              nome_fantasia,
                              style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            )*/
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.people,
                                      size: 17,
                                      color: Colors.grey[500],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                    ),
                                    Text(
                                        UI().formatarDataFriendly(
                                            dataPontuacao),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                        onTap: () {
                                          if (!curtir) {
                                            onPressedLike();
                                          } else {
                                            onPressedDesLike();
                                          }
                                        },
                                        child: Icon(
                                          curtir
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: curtir
                                              ? Colors.red
                                              : Colors.grey[500],
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                    ),
                                    Text(quantidadeCurtidas.toString())
                                  ],
                                ),
                              ),
                              /*Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  color: Colors.grey[500],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                ),
                              ],
                            ),
                          ),*/
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          color: Colors.transparent,
        ));*/
  }
}

/*RefreshIndicator(
            onRefresh: () {},
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                final maxScroll = scrollNotification.metrics.maxScrollExtent;
                final currentScroll = scrollNotification.metrics.pixels;

                if (maxScroll - currentScroll <= _scrollThreshold) {
                  // fetch more data
                  this
                      ._presenter
                      .doLoadingFeedByUser(widget.id, currentPageNumber);
                  setState(() {
                    isLoadingMore = true;
                    isPerformingRequest = true;
                  });
                }
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var item = list[index];
                        return ItemFeed(
                            nome_fantasia: item.nome_fantasia,
                            imagem: item.imagem,
                            curtir: item.curtir,
                            data_pontuacao: item.data_pontuacao,
                            quantidade_curtidas: item.quantidade_curtidas,
                            nome_usuario: item.nome_usuario + item.id,
                            situacao: item.situacao,
                            onPressed: () {},
                            onPressedLike: () {
                              _presenter.doLike(int.parse(item.id));
                            },
                            onPressedDesLike: () {
                              _presenter.doDesLike(int.parse(item.id));
                            });
                        /*if (index.isEven) {
                          return Text('...');
                        }
                        return Spacer();*/
                      },
                      semanticIndexCallback: (Widget widget, int localIndex) {
                        /*if (localIndex.isEven) {
                          return localIndex ~/ 2;
                        }
                        return null;*/
                      },
                      childCount: list.length,
                    ), /*SliverChildListDelegate(
                      list.toSet().toList().map((item) {
                        return ItemFeed(
                            nome_fantasia: item.nome_fantasia,
                            imagem: item.imagem,
                            curtir: item.curtir,
                            data_pontuacao: item.data_pontuacao,
                            quantidade_curtidas: item.quantidade_curtidas,
                            nome_usuario: item.nome_usuario + item.id,
                            situacao: item.situacao,
                            onPressed: () {},
                            onPressedLike: () {
                              _presenter.doLike(int.parse(item.id));
                            },
                            onPressedDesLike: () {
                              _presenter.doDesLike(int.parse(item.id));
                            });
                      }).toList(),
                    )*/
                  )
                ],
              ),
            ),
          )*/
