import 'package:flutter/material.dart';

class Editpage extends StatefulWidget {
  Editpage(this.isFavorite, this.title, this.description);

  String title;
  String description;
  bool isFavorite;

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();

  @override
  void dispose() {
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titlecontroller = TextEditingController(text: widget.title);
    _descriptioncontroller = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop({
                'title': _titlecontroller.text,
                'description': _descriptioncontroller.text,
                'isFavorite': widget.isFavorite,
              });
            },
            child: Text('완료'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
            },
            icon:
                widget.isFavorite
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titlecontroller,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.short_text_rounded),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(controller: _descriptioncontroller),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
