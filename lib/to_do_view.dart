import 'package:flutter/material.dart';
import 'package:to_do_list/detailpage.dart';
import 'package:to_do_list/to_do_entity.dart';

class ToDoview extends StatefulWidget {
  const ToDoview({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.index,
  });

  final List<ToDoEntity> toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;
  final int index;

  @override
  State<ToDoview> createState() => _ToDoviewState();
}

class _ToDoviewState extends State<ToDoview> {
  @override
  Widget build(BuildContext context) {
    final toDo = widget.toDo[widget.index];
    bool isFavorite = toDo.isFavorite;
    bool isDone = toDo.isDone;
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailPage(
                  toDo.isFavorite,
                  toDo.title,
                  toDo.description ?? '',
                ),
          ),
        );
        if (result != null) {
          setState(() {
            toDo.isFavorite = result['isFavorite'];
            toDo.title = result['title'];
            toDo.description = result['description'];
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => widget.onToggleDone(),
                  child:
                      isDone
                          ? Icon(Icons.check_circle)
                          : Icon(Icons.circle_outlined),
                ),
                SizedBox(width: 10),
                isDone
                    ? Expanded(
                      child: Text(
                        toDo.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationThickness: 1,
                        ),
                      ),
                    )
                    : Expanded(
                      child: Text(toDo.title, overflow: TextOverflow.ellipsis),
                    ),
                Spacer(),
                GestureDetector(
                  onTap: () => widget.onToggleFavorite(),
                  child:
                      isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
