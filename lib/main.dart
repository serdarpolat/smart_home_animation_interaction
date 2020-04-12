import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_animation/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;

  bool isOpened = false;
  bool menuOpen = true;
  bool textCtrl = false;

  String _animation = "open";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      width: w,
                      height: menuOpen ? 498 : 420,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      height: menuOpen ? 180 : 130,
                    ),
                    ...tiles.map((e) {
                      return CustomListTile(
                        w: w,
                        img: e.img,
                        title: e.title,
                        subtitle: e.subtitle,
                        isOpened: isOpened,
                        onTap: () {
                          setState(() {
                            isOpened = !isOpened;
                          });
                        },
                      );
                    }).toList(),
                    SizedBox(height: 36),
                    Container(
                      width: 54,
                      height: 54,
                      child: Center(
                        child: Icon(Icons.add, color: MyTheme.grey),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: MyTheme.lightGrey,
                          width: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Add New Device",
                      style: TextStyle(
                        color: MyTheme.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 240),
              width: w,
              height: menuOpen ? 498 : 420,
              color: MyTheme.indigo,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 240),
                    left: menuOpen ? 220 : (w - 300) / 2,
                    top: menuOpen ? -160 : -165,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 240),
                      width: menuOpen ? 900 : 300,
                      height: menuOpen ? 900 : 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyTheme.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? -100 : 66,
              left: 156,
              child: Container(
                width: 32,
                height: 32,
                child: Image.asset(
                  "assets/images/cloud.png",
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? -100 : 66,
              left: 230,
              child: Container(
                width: 64,
                height: 64,
                child: Image.asset(
                  "assets/images/cloud.png",
                  color: Colors.white,
                ),
              ),
            ),
            //! Bolts
            ...bolts.map((e) {
              return BoltWidget(
                menuOpen: menuOpen,
                w: w,
                boltModel: e,
              );
            }).toList(),
            //! Flare
            Positioned(
              top: 40,
              left: 0,
              child: Container(
                width: w,
                height: 380,
                child: FlareActor(
                  "assets/images/hero.flr",
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  animation: _animation,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? 288 : 164,
              left: 0,
              child: Container(
                width: w,
                child: AnimatedPadding(
                  duration: Duration(milliseconds: 360),
                  padding: EdgeInsets.symmetric(horizontal: textCtrl ? 12 : 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Stan's",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Office",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 54 : 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "23 indoor",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                          AnimatedDefaultTextStyle(
                            child: Text(
                              "Door closed",
                            ),
                            style: TextStyle(
                              fontSize: textCtrl ? 36 : 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            duration: Duration(milliseconds: 360),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //! Gateway
            AnimatedPositioned(
              duration: Duration(milliseconds: 360),
              top: menuOpen ? 375 : 255,
              left: 24,
              child: Container(
                width: w - 48,
                height: 240,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (w - 48) / 2,
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/gateway.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(24),
                        ),
                      ),
                    ),
                    Container(
                      width: (w - 48) / 2,
                      height: 240,
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          SizedBox(height: 24),
                          Text(
                            "Gateway",
                            style: TextStyle(
                              color: MyTheme.textColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: MyTheme.grey,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 52),
                            child: Divider(
                              height: 2,
                              color: MyTheme.lightGrey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Alarming",
                            style: TextStyle(
                              color: MyTheme.grey,
                              fontSize: 22,
                            ),
                          ),
                          Spacer(),
                          CustomSwitch(
                            isOpened: menuOpen,
                            onTap: () {
                              if (menuOpen) {
                                setState(() {
                                  _animation = "close";
                                });
                              } else {
                                setState(() {
                                  _animation = "open";
                                });
                              }

                              setState(() {
                                textCtrl = true;
                                menuOpen = !menuOpen;
                              });

                              Future.delayed(Duration(milliseconds: 160), () {
                                setState(() {
                                  textCtrl = false;
                                });
                              });
                              print("object");
                            },
                          ),
                          SizedBox(height: 24),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: MyTheme.indigo.withOpacity(0.3),
                      offset: Offset(8, 8),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/brand_logo.png",
                        color: Colors.white,
                        height: 32,
                      ),
                      Image.asset(
                        "assets/images/menu_lines.png",
                        color: Colors.white,
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoltModel {
  final double topBefore;
  final double leftBefore;
  final double size;
  final String img;

  BoltModel(this.topBefore, this.leftBefore, this.size, this.img);
}

List<BoltModel> bolts = [
  BoltModel(90, 104, 50, "assets/images/flash_left.png"),
  BoltModel(180, 32, 68, "assets/images/flash_left.png"),
  BoltModel(84, 284, 60, "assets/images/flash_right.png"),
  BoltModel(200, 352, 64, "assets/images/flash_right.png"),
];

class BoltWidget extends StatelessWidget {
  final bool menuOpen;
  final double w;
  final BoltModel boltModel;

  const BoltWidget({Key key, this.menuOpen, this.w, this.boltModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 360),
      curve: Curves.easeIn,
      top: menuOpen ? boltModel.topBefore : 460,
      left: menuOpen ? boltModel.leftBefore : (w - boltModel.size) / 2,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 360),
        width: menuOpen ? boltModel.size : 5,
        height: menuOpen ? boltModel.size : 5,
        padding: EdgeInsets.all(5),
        child: Image.asset(
          boltModel.img,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomTileModel {
  final String title;
  final String subtitle;
  final String img;

  CustomTileModel(this.title, this.subtitle, this.img);
}

List<CustomTileModel> tiles = [
  CustomTileModel("My Lamp", "Online", "assets/images/my_lamp.png"),
  CustomTileModel("Philips Lamp", "Online", "assets/images/phlilips_lamp.png"),
  CustomTileModel("Camera", "Sleeping", "assets/images/camera.png"),
  CustomTileModel("mi Fan", "Online", "assets/images/mi_fan.png"),
];

class CustomListTile extends StatelessWidget {
  final double w;
  final String img;
  final String title;
  final String subtitle;
  final bool isOpened;
  final Function onTap;

  const CustomListTile(
      {Key key,
      this.w,
      this.img,
      this.title,
      this.subtitle,
      this.isOpened,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w - 48,
      height: 102,
      padding: EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: MyTheme.lightGrey,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: MyTheme.textColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MyTheme.textColor,
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: MyTheme.grey,
                ),
              )
            ],
          ),
          Spacer(),
          CustomSwitch(isOpened: isOpened, onTap: onTap),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  final bool isOpened;
  final Function onTap;

  const CustomSwitch({Key key, this.isOpened, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 240),
        width: 74,
        height: 44,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 240),
              top: 2,
              left: isOpened ? 32 : 2,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: isOpened ? MyTheme.pink : MyTheme.lightGrey,
        ),
      ),
    );
  }
}
