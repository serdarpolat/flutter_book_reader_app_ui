import 'package:flutter/material.dart';
import './book_data.dart';

class TabTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createPopularBooks(Book book) => FeaturedFreeBooks(
          bookName: book.name,
          bookImg: book.image,
          revCount: book.reviewers,
          bookPrice: book.price,
        );

    final scroll = Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: books.map((book) => createPopularBooks(book)).toList(),
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
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/pink.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
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
                          'Popular Books',
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
                          'You may also like',
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
                  new MayLikeBooks(
                    bookImage: 'images/korluk.jpg',
                    bookName: 'Körlük',
                  ),
                  new MayLikeBooks(
                    bookImage: 'images/cani.jpg',
                    bookName: 'Cani',
                  ),
                  new MayLikeBooks(
                    bookImage: 'images/ben_malala.jpg',
                    bookName: 'Ben, Malala',
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

class MayLikeBooks extends StatelessWidget {

  final String bookImage;
  final String bookName;

  MayLikeBooks({
    Key key, this.bookImage, this.bookName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.2, 1.0),
              blurRadius: 5.0,
              color: Colors.black26,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bookImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
              //  mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    bookName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, qui harum\nelitr an, at lobortis incor rupte per, odio\nagam eam an.',
                    style: TextStyle(
                      color: Color(0xFFBBCCCC),
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color(0xFFEEBA06),
                        size: 14.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFEEBA06),
                        size: 14.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFEEBA06),
                        size: 14.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFEEBA06),
                        size: 14.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFBBCCCC),
                        size: 14.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                ],
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
  final double bookPrice;
  final num revCount;

  FeaturedFreeBooks(
      {Key key,
      this.bookImg,
      this.bookName,
      this.bookAuthor,
      this.bookPrice,
      this.revCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 150.0,
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
            SizedBox(
              height: 8.0,
            ),
            Text(
              bookName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 14.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 14.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 14.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFEEBA06),
                  size: 14.0,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFBBCCCC),
                  size: 14.0,
                ),
              ],
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              '\$ ' + bookPrice.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
