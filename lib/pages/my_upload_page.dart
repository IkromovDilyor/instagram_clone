



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'my_feed_page.dart';
import 'my_feed_page.dart';
import 'my_feed_page.dart';

class MyLikesPage extends StatefulWidget {


  PageController pageController;
  MyLikesPage({this.pageController});


  @override
  _MyLikesPageState createState() => _MyLikesPageState();
}

class _MyLikesPageState extends State<MyLikesPage> {
  PageController pageController;
  var captionController=TextEditingController();
  File _image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });}
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Pick Photo'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Take Photo'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
    _uploadNewPost(){
      String caption =captionController.text.toString().trim();
      if(caption.isEmpty) return;
      if(_image==null) return;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Upload",style: TextStyle(color: Colors.black,fontFamily: "Billabong",fontSize: 25),),
        actions: [
          IconButton(
            onPressed: (){
              widget.pageController.animateToPage(0,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              _uploadNewPost();
            },
            icon: Icon(Icons.post_add,color: Color.fromARGB(252, 175, 69, 1),),
          )
        ],

      ),
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
               GestureDetector(
                 onTap: (){
                   _showPicker(context);


                 },
                 child:  Container(
                   width:double.infinity,
                   height: MediaQuery.of(context).size.width,
                   color: Colors.grey.withOpacity(0.4),
                   child: _image ==null ?Center(

                     child: Icon(Icons.add_a_photo,size: 60,color: Colors.grey,),
                   ):Stack(
                     children: [
                       Image.file(_image,width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                       Container(
                         padding: EdgeInsets.all(10),
                         width: double.infinity,
                         color: Colors.black12,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             IconButton(
                           onPressed: (){
                             setState(() {
                               _image=null;
                             });
                           }
                           ,
                               icon: Icon(Icons.highlight_remove),
                               color: Colors.white,
                             )
                           ],
                         )

                         ,
                       ),
                     ],
                   )
                 ),
               ) ,


                Container(
                  padding: EdgeInsets.all(10),
                   child: TextField(
                     controller: captionController,
                     style: TextStyle(color: Colors.black),
                     keyboardType: TextInputType.multiline,
                     minLines: 1,
                     maxLines: 5,

                     decoration: InputDecoration(
                       hintText: "Caption",
                       hintStyle: TextStyle(fontSize: 17.0,color: Colors.black38)
                     ),
                   ),
                 )
              ],
            ),

          )
      ),
    );
  }
}