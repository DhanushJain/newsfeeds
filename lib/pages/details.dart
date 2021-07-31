import 'package:flutter/material.dart';
import 'apicall.dart';

class details_page extends StatefulWidget {
  final int index;
  details_page({this.index});

  @override
  _details_pageState createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
         ClipRRect(
              // borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "${fetchnews[widget.index]['PicUrl'].toString()}",
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
          SizedBox(height: 20),
          SingleChildScrollView(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                       "${fetchnews[widget.index]['Name'].toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Row(
                      children: [
                         Container(
                           alignment: Alignment.centerLeft,
                           child: Text(
                    "Age :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " ${fetchnews[widget.index]['Age'].toString()}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                        )
                         ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                         Container(
                           alignment: Alignment.centerLeft,
                           child: Text(
                    "Voiced by :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " ${fetchnews[widget.index]['VoicedBy'].toString()}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                 Row(
                      children: [
                         Container(
                           alignment: Alignment.centerLeft,
                           child: Text(
                    "Status :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " ${fetchnews[widget.index]['Status'].toString()}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                        )
                         ],
                    ),
                    SizedBox(height: 10),

                 Row(
                      children: [
                         Container(
                           alignment: Alignment.centerLeft,
                           child: Text(
                    "First Appearance :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " ${fetchnews[widget.index]['FirstAppearance'].toString()}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                        )
                         ],
                    ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Profession :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${fetchnews[widget.index]['Profession'].toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Relatives :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${fetchnews[widget.index]['Relatives'].toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//   buildSlider() {
//     return Container(
//       padding: EdgeInsets.only(left: 0),
//       height: 250.0,
//       child: ListView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         primary: false,
//         itemBuilder: (BuildContext context, int index) {
//           Map place = places[index];

//           return Padding(
//             padding: EdgeInsets.only(right: 0.0),
//             child: ClipRRect(
//               // borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 "${place["img"]}",
//                 height: 250.0,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

