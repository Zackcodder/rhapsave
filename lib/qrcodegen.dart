import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenertor extends StatefulWidget {
  const QRGenertor({super.key});

  @override
  State<QRGenertor> createState() => _QRGenertorState();
}

class _QRGenertorState extends State<QRGenertor> {
  final TextEditingController _editingController =
      TextEditingController(text: 'Enter Item');
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Barcode Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                data = value;
              });
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                data = _editingController.text;
              });
            },
            child: const Text('Generate QRCode'),
          ),
          Center(
            child: QrImageView(
              data: '$data',
              version: QrVersions.auto,
              size: 200,
            ),
          )
        ],
      ),
    );
  }
}
