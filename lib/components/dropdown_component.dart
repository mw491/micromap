import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';

class DropdownComponent extends StatefulWidget {
  final String initialValue;
  final List<String> list;
  final void Function(String)? onChanged;

  const DropdownComponent(
      {super.key,
      required this.initialValue,
      required this.list,
      required this.onChanged});

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue = widget.initialValue;
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Expanded(
        child: DropdownButton(
          underline: Container(),
          value: selectedValue,
          isExpanded: true,
          iconEnabledColor: kBlueColour2,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Plus Jakarta Sans',
          ),
          items: widget.list.map(
            (String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ));
            },
          ).toList(),
          onChanged: (String? newValue) {
            widget.onChanged!(newValue!);
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
