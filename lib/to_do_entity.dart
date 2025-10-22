class ToDoEntity {
  ToDoEntity({
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
  });

   String title;
   String? description;
   bool isFavorite;
   bool isDone;
}
