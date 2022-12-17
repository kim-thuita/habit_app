import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class List_TileL extends StatelessWidget {
  final String text;
  final bool istaskdone;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deletetask;

  List_TileL({
    super.key,
    required this.istaskdone,
    this.onchanged,
    required this.text,
    this.deletetask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletetask,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow[250],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    decoration: istaskdone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              ///checkbox
              Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.red,
                  value: istaskdone,
                  onChanged: onchanged)
            ],
          ),
        ),
      ),
    );
  }
}
