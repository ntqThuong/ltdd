
import 'package:flutter/material.dart';// import thuw vieen 
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController toanController = TextEditingController();
  TextEditingController vanController = TextEditingController();
  TextEditingController anhController = TextEditingController();

  String result = '';

  String get validate {
    try {
      double.parse(toanController.text.trim());
    } on FormatException {
      return 'Diem toan phai la so 😐';
    }
    try {
      double.parse(vanController.text.trim());
    } on FormatException {
      return 'Diem van phai la so 😐';
    }
    try {
      double.parse(anhController.text.trim());
    } on FormatException {
      return 'Diem anh phai la so 😐';
    }
    return 'isChecked';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.yellow, fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 40.0, bottom: 20.0),
            child: Column(
              children: [
                const Text(
                  'Nhap Diem',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: toanController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: 'Nhap diem toan',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Diem toan',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: vanController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: 'Nhap diem van',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Diem van',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: anhController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: 'Nhap diem anh',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Diem anh',
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    result = '';
                    setState(() {});

                    if (validate != 'isChecked') {
                      final snackBar = SnackBar(content: Text(validate));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    double toan = double.parse(toanController.text.trim());
                    double van = double.parse(vanController.text.trim());
                    double anh = double.parse(anhController.text.trim());
                    result = ((toan + van + anh) / 3).toStringAsFixed(2);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.yellow, fontSize: 16.8),
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    const Text(
                      'Result: ',
                      style: TextStyle(color: Colors.brown, fontSize: 16.8),
                    ),
                    Text(
                      result,
                      style: const TextStyle(color: Colors.red, fontSize: 16.8),
                    ),
                  ],
                ),
                const Divider(height: 16.0, thickness: 1.2, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

