import 'package:flutter/material.dart';
import 'package:to_do_list/editpage.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.isFavorite, this.listname, this.description);

  String listname;
  String description;
  bool isFavorite;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    widget.isFavorite;
    widget.listname;
    widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop({
              'isFavorite': widget.isFavorite,
              'title': widget.listname,
              'description': widget.description,
            });

          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Editpage(
                        widget.isFavorite,
                        widget.listname,
                        widget.description,
                      ),
                ),
              );
              if (result != null) {
                setState(() {
                  widget.isFavorite = result['isFavorite'];
                  widget.listname = result['title'];
                  widget.description = result['description'];
                });
              }
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
            },
            icon:
                widget.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.listname,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              overflow: TextOverflow.visible,
              softWrap: true,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.short_text_rounded),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.description,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
