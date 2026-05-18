import 'package:flutter/material.dart';
import 'package:myapp/models/author.dart';
import 'package:myapp/models/book.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/utils/db.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.title});

  final String title;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var db = ConnectionDatabase();
  int sayac = 1;
  late List<Book> bookList = [];
  late List<Author> authorList = [];
  late List<Category> categoryList = [];
  late String islem = "";
  late int bid = 0;
  late String title;
  late Author? selectedAuthor = authorList.first;
  late Category? selectedCategory = categoryList.first;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _mysqlCRUD(islem, bid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (x) {
                          setState(() {
                            title = x.toString();
                          });
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(fontSize: 20),
                            labelText: "Başlık",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            ))),
                        validator: (x) {
                          if (x.toString().isEmpty) {
                            return "Doldurulması Zorunludur!";
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      authorList.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 3, top: 3, right: 3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.topLeft,
                              child: DropdownButton<Author>(
                                isExpanded: true,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                                value: selectedAuthor,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedAuthor = newValue;
                                  });
                                },
                                items: authorList.map<DropdownMenuItem<Author>>(
                                    (Author author) {
                                  return DropdownMenuItem<Author>(
                                    value: author,
                                    child: Text(author.name),
                                  );
                                }).toList(),
                              ),
                            )
                          : const SizedBox(),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      categoryList.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 3, top: 3, right: 3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.topLeft,
                              child: DropdownButton<Category>(
                                isExpanded: true,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                                value: selectedCategory,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                },
                                items: categoryList
                                    .map<DropdownMenuItem<Category>>(
                                        (Category category) {
                                  return DropdownMenuItem<Category>(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList(),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {
                      islem = "kaydet";
                    });

                    _mysqlCRUD(islem, bid);
                    _onAlertSuccess(context);
                    formKey.currentState!.reset();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(color: Colors.teal),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save,
                        size: 32,
                        color: Colors.white,
                      ),
                      Text(
                        " Kaydet",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Silmek İstediğiniz Kaydı Sağa Kaydır!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.topLeft,
            child: ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  sayac++;

                  return Dismissible(
                    key: Key(sayac.toString()),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      setState(() {
                        islem = "sil";
                        bid = bookList[index].bid;
                      });

                      _mysqlCRUD(islem, bid);
                      _onAlertWarning(context);
                    },
                    child: Card(
                        color: index % 2 == 0
                            ? Colors.purple[100]
                            : Colors.purple[200],
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipOval(
                              child: Text(bookList[index].title[0]),
                            ),
                          ),
                          title: Text(bookList[index].title),
                          subtitle: Text(
                              "${authorList.firstWhere((o) => o.aid == bookList[index].aid).name.toString()}, ${categoryList.firstWhere((o) => o.catid == bookList[index].catid).name.toString()}"),
                          trailing: const Icon(
                            Icons.arrow_right,
                            size: 36,
                          ),
                        )),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Future _mysqlCRUD(String islem, int bid) async {
    final conn = await db.getConnection();

    await conn.connect();

    if (islem == "kaydet") {
      debugPrint("Kayıt Ekleniyor");
      await conn.execute(
          'insert into book (title, aid, catid) values (:title, :aid, :catid)',
          {
            "title": title,
            "aid": selectedAuthor!.aid,
            "catid": selectedCategory!.catid
          });
      bookList = [];
    }

    if (islem == "sil") {
      debugPrint("Kayıt siliniyor");
      await conn.execute('delete from book where bid=:bid', {"bid": bid});

      bookList = [];
    }

    var resultBook = await conn.execute("SELECT * FROM book");
    for (var row in resultBook.rows) {
      bookList.add(Book(
          int.parse(row.colByName("bid").toString()),
          row.colByName("title").toString(),
          int.parse(row.colByName("aid").toString()),
          int.parse(row.colByName("catid").toString())));
    }

    
    if (islem == "") {
      var resultAuthor = await conn.execute("SELECT * FROM author");
      for (var row in resultAuthor.rows) {
        authorList.add(Author(
          int.parse(row.colByName("aid").toString()),
          row.colByName("name").toString(),
        ));
      }

    
      var resultCategory = await conn.execute("SELECT * FROM category");
      for (var row in resultCategory.rows) {
        categoryList.add(Category(
          int.parse(row.colByName("catid").toString()),
          row.colByName("name").toString(),
        ));
      }

     
    }

    setState(() {
      bookList = bookList;
      authorList = authorList;
      categoryList = categoryList;
    });
  }

  void _onAlertWarning(BuildContext context) {
    Alert(
      type: AlertType.warning,
      context: context,
      title: "KAYIT SİLİNDİ!",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "KAPAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  void _onAlertSuccess(BuildContext context) {
    Alert(
      type: AlertType.success,
      context: context,
      title: "KAYIT EKLENDİ!",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "KAPAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
