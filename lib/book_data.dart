class Book {
  String name,
      author,
      image,
      desc =
          'Lorem ipsum dolor sit amet, qui harum elitr an, at lobortis incor rupte per, odio agam eam an.';
  int pages;
  double price;
  int reviewers;
  double rank;

  Book(
    this.name,
    this.author,
    this.image,
    this.pages,
    this.price,
    this.reviewers,
    this.rank,
  );
}

final List<Book> books = [
    Book('Anı Bahçesi', 'Rachel Hore', 'images/ani_bahcesi.jpg', 300, 12.99, 32, 2.3),
    Book('Antika Titanik', 'Murat Menteş', 'images/antika_titanik.jpg', 300, 23.50, 57,
        2.3),
    Book('Aşk Acıları', 'Patrick Avrane', 'images/ask_acilari.jpg', 300, 18.90, 41,
        2.3),
    Book('Başlangıç', 'Dan Brown', 'images/baslangic.jpg', 300, 24.90, 81, 2.3),
    Book(
        'Ben, Malala', 'Christina Lamb', 'images/ben_malala.jpg', 300, 15.50, 17, 2.3),
    Book('Cani', 'James Hayman', 'images/cani.jpg', 300, 28.30, 30, 2.3),
    Book('Dubrovski', 'Aleksandr Puşkin', 'images/dubrovski.jpg', 300, 12.99, 55, 2.3),
    Book('Fahrenheit 451', 'Ray Bradbury', 'images/fahrenheit_451.jpg', 300, 23.50, 67,
        2.3),
    Book('Fareler ve İnsanlar', 'John Steinbeck',
        'images/fareler_ve_insanlar.jpg', 300, 18.90, 22, 2.3),
    Book('Göçüp Gidenler\nKoleksiyoncusu', 'Şermin Yaşar',
        'images/gocup_gidenler.jpg', 300, 24.90, 13, 2.3),
    Book('Kördüğüm', 'Ayşe Kulin', 'images/kordugum.jpg', 300, 15.50, 28, 2.3),
    Book('Körlük', 'Jose Saramago', 'images/korluk.jpg', 300, 28.30, 48, 2.3),
    Book('Kürk Mantolu\nMadonna', 'Sabahattin Ali', 'images/KurkManto.jpg', 300, 12.99,
        102, 2.3),
    Book('Simyaci', 'Paulo Coelho', 'images/simyaci.jpg', 300, 18.90, 66, 2.3),
    Book('Yabancı', 'Albert Camus', 'images/yabanci.jpg', 300, 24.90, 10, 2.3),
  ];
