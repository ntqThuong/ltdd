import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Điểm Trung Bình 3 Môn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculateAveragePage(),
    );
  }
}

class CalculateAveragePage extends StatefulWidget {
  @override
  _CalculateAveragePageState createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  TextEditingController toanController = TextEditingController();
  TextEditingController vanController = TextEditingController();
  TextEditingController anhController = TextEditingController();
  double average = 0.0;

  void calculateAverage() {
    double toan = double.tryParse(toanController.text) ?? 0.0;
    double van = double.tryParse(vanController.text) ?? 0.0;
    double anh = double.tryParse(anhController.text) ?? 0.0;

    setState(() {
      average = (toan + van + anh) / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tính Điểm Trung Bình 3 Môn'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: toanController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Điểm Toán'),
            ),
            TextField(
              controller: vanController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Điểm Văn'),
            ),
            TextField(
              controller: anhController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Điểm Anh'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAverage,
              child: Text('Tính Điểm Trung Bình'),
            ),
            SizedBox(height: 20),
            Text(
              'Điểm Trung Bình: ${average.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
