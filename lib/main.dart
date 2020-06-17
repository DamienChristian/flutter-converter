import 'package:converter/widgets/body.dart';
import 'package:flutter/material.dart';

import './data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 245, 212, 1),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.w600),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66),
        child: AppBar(
          title: Text('Converter'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: DefaultTabController(
        length: dataObj.mainData.keys.length,
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(height: 38),
                padding: EdgeInsets.zero,
                child: TabBar(
                  indicator: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0,
                  isScrollable: true,
                  labelPadding: EdgeInsets.all(5),
                  tabs: dataObj.mainData.keys
                      .map((e) => Tab(
                            child: Container(
                              height: 30,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Divider(
                color: Colors.orange,
                endIndent: 10,
                indent: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                      children: dataObj.mainData.keys
                          .map((e) => Body(
                                mode: e,
                              ))
                          .toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
