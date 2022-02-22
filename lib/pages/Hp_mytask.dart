import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_help_list/helpers/constants.dart';
import 'package:the_help_list/models/Allevent_List.dart';
import 'package:the_help_list/models/Allevents_json.dart';
import 'package:the_help_list/pages/shop_home/home_screen.dart';
import 'package:the_help_list/pages/cart/cart_screen.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  /*List<Allevents> _Allevents;
  bool _loading;

  @override
  void initState() {
    _loading = true;
    Services.getHisevents().then((allevents) {
      setState(() {
        _Allevents = allevents;
        _loading = false;
      });
    });
  }
*/
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: OutlineButton(
                  borderSide: new BorderSide(color: Colors.black, width: 1.5),
                  color: Colors.white,
                  child: Text(
                    "\$5000",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                )),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
            SizedBox(width: 10)
          ],
          backgroundColor: AppbarBack_cl,
          title: new Text(
            title,
            style: TextStyle(color: AppbarTitle_cl),
          ),
          centerTitle: true,
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
              child: _buildTab(context),
            )
          ],
        ));
  }

  Widget _buildTab(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new TabBar(
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.black45,
          ),
          tabs: <Widget>[
            new Tab(
              text: '我發的',
            ),
            new Tab(
              text: '我接的',
            ),
          ],
          controller: _tabController,
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                _spaceRegion(),
                _buildemerbutton(),
              ],
            ),
            new ListView.builder(
              //itemCount: null == _Allevents ? 0 : _Allevents.length,
              itemBuilder: (context, index) {
                //Allevents Alleve = _Allevents[index];
                return ListTile(
                  title: Text(
                    // Alleve.eveName,
                    "找貓咪",
                    style: TextStyle(
                        color: Color.fromARGB(255, 105, 75, 35),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("男9B"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _spaceRegion() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 80,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'PostYourTask'),
              color: AppbarBack_cl,
              child: Row(
                children: [
                  Icon(
                    Icons.touch_app,
                    size: 20,
                  ),
                  Text('刊登')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildemerbutton() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 230,
          ),
          SizedBox(
            width: 80,
            child: FloatingActionButton(
              child: Icon(
                Icons.new_releases,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                print("emergency buttom");
                Navigator.pushNamed(context, 'emergency');
              },
            ),
          ),
        ],
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
