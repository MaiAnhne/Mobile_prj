import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu thành viên'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Em xin chào thầy và các bạn, sau đây là thành viên nhóm 10:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('1. Nguyễn Mai Anh - MSV: 23010490'),
            Text('2. Nguyễn Dương Ngọc Ánh - MSV: 23011500'),
            SizedBox(height: 20),
            Text(
              'Ứng dụng này được phát triển bằng Flutter',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
