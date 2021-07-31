import 'package:flutter/material.dart';
import 'apicall.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> fetchnews = [];

  @override
  void initState() {
    super.initState();
    getAllnews().then((value) {
      setState(() {
        fetchnews = oldVar;
        // print(fetchnews);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          'Simsons',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
      body: Container(
          child: fetchnews.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Colors.grey[700],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${fetchnews[index]['PicUrl'].toString()}"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${fetchnews[index]['Name'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Age : ${fetchnews[index]['Age'].toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Status : ${fetchnews[index]['Status'].toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Voiced by : ${fetchnews[index]['VoicedBy'].toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            fetchnews[index]['Profession'].toString().length >
                                    30
                                ? Text(
                                    "Profession : ${fetchnews[index]['Profession'].toString().substring(0, 30)}...",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  )
                                : Text(
                                    "Profession : ${fetchnews[index]['Profession'].toString()}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    details_page(index: index)));
                      },
                    ),
                  ),
                  itemCount: fetchnews.length,
                  shrinkWrap: true,
                )
              : Container()),
    );
  }
}
