import 'package:book_app_reader/book_data.dart';
import 'package:book_app_reader/tab_1.dart';
import 'package:book_app_reader/tab_2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabCtrl;
  Animation flipScreen,
      outScreen,
      recToRight,
      recRadius,
      recScale,
      animMenu,
      animRecStagger,
      reRotateSetScreen,
      reTransSetScreen,
      reScaleSetScreen,
      goRecScreen,
      animCount;
  AnimationController flipScreenCtrl,
      recAnimCtrl,
      setScreenCtrl,
      goRecScreenCtrl,
      animCountCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(
      vsync: this,
      length: 3,
    );

    flipScreenCtrl = AnimationController(
      duration: Duration(milliseconds: 350),
      vsync: this,
    );

    recAnimCtrl = AnimationController(
      duration: Duration(milliseconds: 350),
      vsync: this,
    );

    setScreenCtrl = AnimationController(
      duration: Duration(milliseconds: 460),
      vsync: this,
    );

    goRecScreenCtrl = AnimationController(
      duration: Duration(milliseconds: 350),
      vsync: this,
    );

    animCountCtrl = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    flipScreen = Tween(begin: 0.8, end: 0.0).animate(
      CurvedAnimation(
        parent: flipScreenCtrl,
        curve: Curves.bounceOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    animRecStagger = Tween(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(
        parent: flipScreenCtrl,
        curve: Interval(
          0.1,
          1.0,
          curve: Curves.ease,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });

    outScreen = Tween(begin: -460.0, end: 0.0).animate(flipScreenCtrl)
      ..addListener(() {
        setState(() {});
      });

    recToRight = Tween(begin: 300.0, end: 0.0).animate(recAnimCtrl)
      ..addListener(() {
        setState(() {});
      });

    recScale = Tween(begin: 0.8, end: 1.0).animate(recAnimCtrl)
      ..addListener(() {
        setState(() {});
      });

    recRadius = Tween(begin: 16.0, end: 0.0).animate(recAnimCtrl)
      ..addListener(() {
        setState(() {});
      });

    animMenu = Tween(begin: 50.0, end: 360.0).animate(recAnimCtrl)
      ..addListener(() {
        setState(() {});
      });

    reRotateSetScreen = Tween(begin: 0.0, end: -5.0).animate(
      CurvedAnimation(
        parent: setScreenCtrl,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    reTransSetScreen = Tween(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: setScreenCtrl,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    reScaleSetScreen = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: setScreenCtrl,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    goRecScreen = Tween(begin: 500.0, end: 0.0).animate(goRecScreenCtrl);

    animCount = Tween(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: animCountCtrl,
        curve: Interval(
          0.125,
          0.250,
          curve: Curves.ease,
        ),
      ),
    );

    flipScreenCtrl.forward();
    recAnimCtrl.forward();
    setScreenCtrl.forward();
    goRecScreenCtrl.forward();
    animCountCtrl.forward();
  }

  @override
  void dispose() {
    super.dispose();
    flipScreenCtrl.dispose();
    recAnimCtrl.dispose();
    setScreenCtrl.dispose();
    goRecScreenCtrl.dispose();
    animCountCtrl.dispose();
    tabCtrl.dispose();
  }

  String selectedItem = 'Favorites';
  String menuItems = '';

  void changeSelectedItem() {
    setState(() {
      selectedItem = menuItems;
    });
  }

  createMenuItems() {
    return Material(
      color: Colors.white,
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Transform(
          transform: Matrix4.translationValues(0.0, animMenu.value, 0.0),
          child: Container(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/user8.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      'Antony Marshall',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'San Francisco, CA',
                    style: TextStyle(
                      color: Color(0xFFBBCCCC),
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  //menu
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new _MenuLists(
                          text: 'Account',
                          isOpen: selectedItem == 'Account',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            menuItems = 'Account';
                            selectedItem = 'Account';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Book List',
                          isOpen: selectedItem == 'Book List',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            menuItems = 'Book List';
                            selectedItem = 'Book List';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Categories',
                          isOpen: selectedItem == 'Categories',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            if (outScreen.status == AnimationStatus.completed) {
                              flipScreenCtrl.reverse();
                            } else {
                              flipScreenCtrl.forward();
                            }

                            menuItems = 'Categories';
                            selectedItem = 'Categories';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Favorites',
                          isOpen: selectedItem == 'Favorites',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            menuItems = 'Favorites';
                            selectedItem = 'Favorites';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Shopping Cart',
                          isOpen: selectedItem == 'Shopping Cart',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            menuItems = 'Shopping Cart';
                            selectedItem = 'Shopping Cart';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Profile',
                          isOpen: selectedItem == 'Profile',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            menuItems = 'Profile';
                            selectedItem = 'Profile';

                            changeSelectedItem;
                          },
                        ),
                        new _MenuLists(
                          text: 'Settings',
                          isOpen: selectedItem == 'Settings',
                          onTap: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }

                            if (setScreenCtrl.status ==
                                AnimationStatus.completed) {
                              setScreenCtrl.reverse();
                            } else {
                              setScreenCtrl.forward();
                            }

                            if (goRecScreenCtrl.status ==
                                AnimationStatus.completed) {
                              goRecScreenCtrl.reverse();
                            } else {
                              goRecScreenCtrl.forward();
                            }

                            if (animCountCtrl.status ==
                                AnimationStatus.completed) {
                              goRecScreenCtrl.reverse();
                            } else {
                              goRecScreenCtrl.forward();
                            }

                            menuItems = 'Settings';
                            selectedItem = 'Settings';

                            changeSelectedItem;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          createMenuItems(),
          // Setting Area
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateY(reRotateSetScreen.value) //reRotateSetScreen.value
              ..translate(reTransSetScreen.value) //reTransSetScreen.value
              ..scale(reScaleSetScreen.value), //reScaleSetScreen.value
            alignment: Alignment.centerRight,
            child: SettingScreen(
              reading: animCount.value / 5.0, //reading
              articles: animCount.value/1.0, //articles
              followers: animCount.value / 6.0, //followers
            ),
          ),
          // Home Page Area
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.translationValues(recToRight.value, 0.0, 0.0)
              ..scale(recScale.value)
              ..translate(goRecScreen.value), //translate400
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2.0, 1.0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(recRadius.value),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      elevation: 0.2,
                      leading: Transform(
                        transform: Matrix4.translationValues(
                            animRecStagger.value, 0.0, 0.0),
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          color: Color(0xFFBBCCCC),
                          onPressed: () {
                            if (recAnimCtrl.status ==
                                AnimationStatus.completed) {
                              recAnimCtrl.reverse();
                            } else {
                              recAnimCtrl.forward();
                            }
                          },
                        ),
                      ),
                      actions: <Widget>[
                        Transform(
                          transform: Matrix4.translationValues(
                              animRecStagger.value, 0.0, 0.0),
                          child: IconButton(
                            icon: Icon(Icons.search),
                            color: Color(0xFFBBCCCC),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    body: TabBarView(
                      controller: tabCtrl,
                      children: <Widget>[
                        TabOneScreen(),
                        //***************************** */

                        TabTwoScreen(),
                        /********************* */
                        Container(
                          child: Center(
                            child: Text(
                              'Screen 3',
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    bottomNavigationBar: Material(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.5, 1.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: TabBar(
                          controller: tabCtrl,
                          indicatorColor: Colors.transparent,
                          indicatorWeight: 4.0,
                          labelColor: Colors.black,
                          unselectedLabelColor: Color(0xFFBBCCCC),
                          tabs: <Widget>[
                            Tab(icon: Icon(Icons.import_contacts)),
                            Tab(icon: Icon(Icons.turned_in_not)),
                            Tab(icon: Icon(Icons.notifications_none)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Carry Out Area
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateY(flipScreen.value)
              ..translate(outScreen.value),
            alignment: Alignment.centerLeft,
            child: ClipRect(
              child: Align(
                alignment: Alignment.centerRight,
                child: new CarryOutScreen(flipScreenCtrl: flipScreenCtrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarryOutScreen extends StatelessWidget {
  CarryOutScreen({
    Key key,
    @required this.flipScreenCtrl,
  }) : super(key: key);

  final AnimationController flipScreenCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose the tag you are\ninterested in',
                style: TextStyle(
                  height: 1.2,
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'We will recommended your personality based on\nyour choise.',
                style: TextStyle(
                  color: Color(0xFFBBCCCC),
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BookShelf(
                          imagePath: 'images/fahrenheit_451.jpg',
                          categorie: 'Business',
                        ),
                        BookShelf(
                          imagePath: 'images/korluk.jpg',
                          categorie: 'Literature',
                        ),
                        BookShelf(
                          imagePath: 'images/yabanci.jpg',
                          categorie: 'Photography',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BookShelf(
                          imagePath: 'images/kordugum.jpg',
                          categorie: 'Sports',
                        ),
                        BookShelf(
                          imagePath: 'images/ben_malala.jpg',
                          categorie: 'Parent-child',
                        ),
                        BookShelf(
                          imagePath: 'images/cani.jpg',
                          categorie: 'Fantasy',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50.0),
                width: double.infinity,
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                    if (flipScreenCtrl.status == AnimationStatus.completed) {
                      flipScreenCtrl.reverse();
                    } else {
                      flipScreenCtrl.animateTo(1.571, curve: Curves.bounceOut);
                    }
                  },
                  color: Color(0xFF2B65F9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12.0),
                    child: Text(
                      'Carry out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedFreeBooks extends StatelessWidget {
  final String bookImg;
  final String bookName;
  final String bookAuthor;
  final num revCount;

  FeaturedFreeBooks(
      {Key key, this.bookImg, this.bookName, this.bookAuthor, this.revCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Container(
              width: 120.0,
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: AssetImage(
                    bookImg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuLists extends StatelessWidget {
  final AnimationController menuListCtrl, closeMenu;
  final String text;
  final bool isOpen;
  final Function onTap;

  _MenuLists(
      {Key key,
      this.menuListCtrl,
      this.closeMenu,
      this.text,
      this.isOpen,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFFEEBA06),
      onTap: isOpen ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
        child: Text(
          text,
          style: TextStyle(
            color: isOpen ? Color(0xFFEEBA06) : Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}

class BookShelf extends StatelessWidget {
  final String imagePath;
  final String categorie;

  BookShelf({this.imagePath, this.categorie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Column(
            children: <Widget>[
              Container(
                width: 110.0,
                height: 165.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          categorie,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SettingScreen extends StatelessWidget {
  final double reading, articles, followers;

  SettingScreen({Key key, this.reading, this.articles, this.followers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    createFreeBooks(Book book) => FeaturedFreeBooks(
          bookName: book.name,
          bookAuthor: book.author,
          bookImg: book.image,
          revCount: book.reviewers,
        );

    final scroll = Container(
      padding: const EdgeInsets.only(left: 28.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: books.map((book) => createFreeBooks(book)).toList(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Color(0xFFBBCCCC),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Color(0xFFBBCCCC),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 16.0),
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/user8.jpg'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(6.0, 6.0),
                      blurRadius: 14.0,
                      color: Colors.black45,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
              ),
            ),
            Text(
              'Antony Marshall',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Senior visual designer',
              style: TextStyle(color: Color(0xFFBBCCCC), fontSize: 14.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black54,
                    width: 0.3,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '$reading',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Reading',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFBBCCCC),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '$articles',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Articles',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFBBCCCC),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '$followers' + 'k',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFBBCCCC),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(28.0, 28.0, 28.0, 16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Good managment is the art of making\nproblems so interesting and their solutions\nso constructive',
                    style: TextStyle(
                      color: Color(0xFFBBCCCC),
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Reading List',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xFFEEBA06),
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  scroll,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
