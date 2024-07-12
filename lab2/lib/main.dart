import 'package:flutter/material.dart';
import 'package:lab1/DetailPage.dart';
import 'package:lab1/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student("นายเจษฎา ลีรัตน์", "643450067-0", "images/1.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Jatsada.l@kkumail.com", "https://www.facebook.com/pat.loveasd"),
      Student("นายธนาธิป เตชะ", "643450076-9", "images/2.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Thanathip.t@kkumail.com", "https://www.facebook.com/profile.php?id=100011086212292"),
      Student("นายพีระเดช โพธิ์หล้า", "643450082-4", "images/3.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Peeradech.p@kkumail.com", "https://www.facebook.com/peeradech8888"),
      Student("นายวิญญู พรมภิภักดิ์", "643450084-0", "images/4.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Winyu.p@kkumail.com", "https://www.facebook.com/profile.php?id=100014625613598"),
      Student("นายเทวารัณย์ ชัยกิจ", "643450324-6", "images/5.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Tewaran.c@kkumail.com", "https://www.facebook.com/rungoodnam"),
      Student("นายณัฐกานต์ อินทรพานิชย์", "643450072-7", "images/6.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Natakan.i@kkumail.com", "https://www.facebook.com/wai.nuttakan"),
      Student("นายศุภชัย แสนประสิทธิ์", "643450332-7", "images/7.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Supachai.s@kkumail.com", "https://www.facebook.com/beam.supachai.9"),
      Student("ธนรัตน์ บ้านสระ", "643450658-7", "images/8.jpg", "นักศึกษา มหาลัยขอนแก่นวิทยาเขตหนองคาย", "Thanarat.b@kkumail.com.com", "https://www.facebook.com/profile.php?id=100013270898676"),
   ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Student App"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return displayItem(context: context, student: datas[index]);
        },
      ),
    );
  }

  Widget displayItem({required BuildContext context, required Student student}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(data: student),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: student.studentid,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(student.image),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  student.studentid,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
