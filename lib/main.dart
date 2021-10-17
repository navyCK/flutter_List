import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'ListView with Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
    // 초성 알아내기...
    print(
        "가 : " + ((("가".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "까 : " + ((("까".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "나 : " + ((("나".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "다 : " + ((("다".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "따 : " + ((("따".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "라 : " + ((("라".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "마 : " + ((("마".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "바 : " + ((("바".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "빠 : " + ((("빠".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "사 : " + ((("사".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "싸 : " + ((("싸".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "아 : " + ((("아".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "자 : " + ((("자".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "짜 : " + ((("짜".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "차 : " + ((("차".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "카 : " + ((("카".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "타 : " + ((("타".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "파 : " + ((("파".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "하 : " + ((("하".runes.first - 0xAC00) / 28) / 21).toString() + "\n"

        "창세기 : " + ((("창세기".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "출애굽기 : " + ((("창세기".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
        "레위기 : " + ((("창세기".runes.first - 0xAC00) / 28) / 21).toString() + "\n"
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
