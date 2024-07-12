import 'package:flutter/material.dart';
import 'package:lab1/student.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Student data;

  const DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Detail Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: data.studentid,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(data.image),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "รหัสนักศึกษา: ${data.studentid}",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    "About me: ${data.about}",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Email: ${data.email}",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    "Follow me on:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    iconSize: 40,
                    onPressed: () async {
                      final url = data.socialMediaLink;
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                          forceWebView: false,
                          enableJavaScript: true,
                        );
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
