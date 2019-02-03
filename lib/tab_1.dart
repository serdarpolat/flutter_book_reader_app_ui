import 'package:flutter/material.dart';
import './book_data.dart';

class TabOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createFreeBooks(Book book) => FeaturedFreeBooks(
          bookName: book.name,
          bookAuthor: book.author,
          bookImg: book.image,
          revCount: book.reviewers,
        );

    final scroll = Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: books.map((book) => createFreeBooks(book)).toList(),
        ),
      ),
    );

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Recommended',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Browse',
                            style: TextStyle(
                              color: Color(0xFFBBCCCC),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Container(
                        width: 280.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFBBCCCC),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      Container(
                        width: 140.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEBA06),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      'Continue reading',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Text(
                    'Find more stories in your library',
                    style: TextStyle(
                      color: Color(0xFFBBCCCC),
                      fontSize: 12.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 160.0,
                            height: 240.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/korluk.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Körlük',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFEEBA06),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFBBCCCC),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFBBCCCC),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFBBCCCC),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFBBCCCC),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      InkWell(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.visibility,
                                              color: Color(0xFFBBCCCC),
                                              size: 20.0,
                                            ),
                                            SizedBox(width: 4.0),
                                            Text(
                                              '813k',
                                              style: TextStyle(
                                                color: Color(0xFFBBCCCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.favorite_border,
                                              color: Color(0xFFBBCCCC),
                                              size: 20.0,
                                            ),
                                            SizedBox(width: 4.0),
                                            Text(
                                              '48k',
                                              style: TextStyle(
                                                color: Color(0xFFBBCCCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.cloud_queue,
                                              color: Color(0xFFBBCCCC),
                                              size: 20.0,
                                            ),
                                            SizedBox(width: 4.0),
                                            Text(
                                              '71',
                                              style: TextStyle(
                                                color: Color(0xFFBBCCCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, qui harum elitr an, at lobortis incor rupte per, odio agam eam an.',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0,
                                                vertical: 6.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFEEBA06),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Text(
                                              '#Love',
                                              style: TextStyle(
                                                color: Color(0xFFEEBA06),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                                vertical: 6.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFEEBA06),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Text(
                                              '#Drama',
                                              style: TextStyle(
                                                color: Color(0xFFEEBA06),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 6.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFEEBA06),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Text(
                                              '#Art',
                                              style: TextStyle(
                                                color: Color(0xFFEEBA06),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 2.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFBBCCCC),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            Container(
                              width: 27.0,
                              height: 3.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEBA06),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('27%',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Featured Free Books',
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
            Text(
              bookName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bookAuthor,
              style: TextStyle(fontSize: 14.0, color: Color(0xFFE55B4E)),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 16.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 16.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 16.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 16.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFBBCCCC),
                  size: 16.0,
                ),
              ],
            ),
            Text(
              revCount.toString() + ' reviewes',
              style: TextStyle(color: Colors.black54, fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
