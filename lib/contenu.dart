import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Contenu extends StatefulWidget {
  final DocumentSnapshot contenu;

  const Contenu({Key key, this.contenu}) : super(key: key);
  @override
  _ContenuState createState() => _ContenuState();
}

class _ContenuState extends State<Contenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.contenu.data['image'],
                          ),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    color: Colors.black54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Wrap(
                          children: <Widget>[
                            Text(
                              widget.contenu.data['category'],
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10),
                            Text(widget.contenu.data['date'].toString(),style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share(
                            widget.contenu.data['contenu'].toString(),
                            subject: "Share this, it could help ! " +
                                widget.contenu.data['title']
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.contenu.data['title'],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  Divider(color: Colors.grey.shade700,),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.contenu.data['contenu'].toString(),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
