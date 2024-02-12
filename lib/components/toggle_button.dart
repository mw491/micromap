import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';

class TogglebuttonComponent extends StatefulWidget {
  final List<String> selections;

  const TogglebuttonComponent({super.key, required this.selections});

  @override
  State<TogglebuttonComponent> createState() => _TogglebuttonComponentState();
}

class _TogglebuttonComponentState extends State<TogglebuttonComponent> {
  List<bool> selections_state = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      height: 37,
      child: ToggleButtons(
        isSelected: selections_state,
        borderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        fillColor: Colors.transparent,
        splashColor: Colors.transparent,
        selectedColor: Colors.white,
        onPressed: (int index) {
          setState(() {
            selections_state.fillRange(0, 2, false);
            selections_state[index] = !selections_state[index];
          });
        },
        children: List.generate(
          widget.selections.length,
          (index) => Container(
            height: 37,
            decoration: BoxDecoration(
              color: selections_state[index] ? kBlueColour2 : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.selections[index],
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
