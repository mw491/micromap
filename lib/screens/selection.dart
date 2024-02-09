import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  String sampleType = kSampleTypes[0];
  String sampleSite = kSampleSites[0];
  String microOrganism = kMicroOrganisms[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      body: Column(
        children: [
          Container(
            color: kBackgroundColour,
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Micro Map',
                        style: TextStyle(
                          fontSize: 36,
                          color: kBlueColour3,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'select a sample type, its site and the micro-organism grown',
                        style: TextStyle(
                          fontSize: 14,
                          color: kBlueColour3,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.cookie)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: kBlueColour3,
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: kBlueColour2,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sample type',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownComponent(
                  initialValue: sampleType,
                  list: kSampleTypes,
                  onChanged: (newValue) {
                    setState(() {
                      sampleType = newValue;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sample site',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownComponent(
                  initialValue: sampleSite,
                  list: kSampleSites,
                  onChanged: (newValue) {
                    setState(() {
                      sampleSite = newValue;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Micro-organism',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownComponent(
                  initialValue: microOrganism,
                  list: kMicroOrganisms,
                  onChanged: (newValue) {
                    setState(() {
                      microOrganism = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: kBlueColour5,
          )
        ],
      ),
    );
  }
}

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
