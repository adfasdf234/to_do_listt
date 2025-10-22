import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();

  bool isFavorite = false;
  bool onSelected1 = false;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titlecontroller.addListener(() {
      setState(() {});
    });
    _descriptioncontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titlecontroller,
            cursorColor: Colors.grey,
            autofocus: true,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: '새 할 일',
              hintStyle: TextStyle(fontSize: 16),
            ),
          ),
          if (onSelected1)
            TextField(
              keyboardType: TextInputType.multiline,
              controller: _descriptioncontroller,
              maxLines: null,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                hintText: '세부정보 추가',
                hintStyle: TextStyle(fontSize: 16),
              ),
            ),
          SizedBox(height: 5),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    onSelected1 = !onSelected1;
                  });
                },
                child:
                    onSelected1
                        ? Container()
                        : Icon(Icons.short_text_rounded, size: 24),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child:
                    isFavorite
                        ? Icon(Icons.star, size: 24)
                        : Icon(Icons.star_border, size: 24),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (_titlecontroller.text.isEmpty && _descriptioncontroller.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('내용을 입력해주세요!')));
                    Navigator.of(context).pop();
                  }
                  if (_titlecontroller.text.isNotEmpty && _descriptioncontroller.text.isNotEmpty) {
                    Navigator.of(context).pop({
                      'title': _titlecontroller.text,
                      'description': _descriptioncontroller.text,
                      'isFavorite': isFavorite,
                    });
                  }
                },
                child: Text(
                  '저장',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                    _titlecontroller.text.isEmpty && _descriptioncontroller.text.isEmpty
                            ? Colors.grey
                            : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
