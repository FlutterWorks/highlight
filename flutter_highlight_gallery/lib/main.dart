import 'package:flutter_web/material.dart';
import 'flutter_highlight.dart';
import 'all_styles.dart';
import 'example.dart';

void main() => runApp(MyApp());

final title = 'Flutter Highlight Gallery';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String language = 'dart';
  String theme = 'default';

  Widget _buildMenuContent(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 16)),
        Icon(Icons.arrow_drop_down)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          PopupMenuButton(
            child: _buildMenuContent(language),
            itemBuilder: (context) {
              return exampleMap.keys.map((key) {
                return CheckedPopupMenuItem(
                  value: key,
                  child: Text(key),
                  checked: language == key,
                );
              }).toList();
            },
            onSelected: (selected) {
              if (selected != null) {
                setState(() {
                  language = selected;
                });
              }
            },
          ),
          PopupMenuButton<String>(
            // padding: const EdgeInsets.all(0),
            child: _buildMenuContent(theme),
            // icon: Icon(Icons.style),
            itemBuilder: (context) {
              return allStyles.keys.map((key) {
                return CheckedPopupMenuItem(
                  value: key,
                  child: Text(key),
                  checked: theme == key,
                );
              }).toList();
            },
            onSelected: (selected) {
              if (selected != null) {
                setState(() {
                  theme = selected;
                });
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Highlighter(exampleMap[language],
                language: 'dart', style: allStyles[theme])
          ],
        ),
      ),
    );
  }
}