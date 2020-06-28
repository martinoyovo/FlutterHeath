import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:showcaseview/showcase.dart';

import 'package:wwsafe/contenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _data;
  //GlobalKey _key = GlobalKey();
  Future getConseils() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("conseils").getDocuments();

    return snap.documents;
  }

  /*AnimationController controller;
  Animation animation;*/
  @override
  void initState() {
    super.initState();

    /*controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    animation = Tween<double>(
      begin: 80.0,
      end: 90.0
    ).animate(controller)..addListener(() {
    });*/
    _data = getConseils();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _listKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome', style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 1),),
        flexibleSpace: SizedBox(height: 10,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10, top: 20),
          child: FutureBuilder(
              future: _data,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: ListTile(
                                  leading: Wrap(
                                    direction: Axis.horizontal,
                                    children: <Widget>[
                                      Container(
                                        height: 90,
                                        width: MediaQuery.of(context).size.width/5,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data[index].data['image']),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        width: 1.5,
                                        height: 100,
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].data['title'],
                                        style: TextStyle(fontSize: 25, color: Colors.grey.shade700),
                                      ),
                                      SizedBox(height: 10,),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox(height: 10,),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.calendar_today, color: Colors.blue),
                                            SizedBox(width: 6,),
                                            Text(snapshot.data[index].data['date']
                                                .toString(), style: TextStyle(fontSize: 17, color: Colors.grey.shade700)),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.apps, color: Colors.blue,),
                                            SizedBox(width: 6,),
                                            Text(snapshot.data[index].data['category']
                                                .toString(), style: TextStyle(fontSize: 17, color: Colors.grey.shade700)),
                                          ],
                                        )
                                      ]
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(CupertinoIcons.right_chevron, size: 35, color: Colors.blue,),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                          onTap: () => Navigator.of(context).push(
                              PageTransition(
                                  type: PageTransitionType.downToUp,
                                  child: Contenu(
                                    contenu: snapshot.data[index],
                                  )
                              )
                          )
                      );
                    });
              }),
        )
    );
  }
}
