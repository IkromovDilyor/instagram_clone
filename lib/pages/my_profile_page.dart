



import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
    });
  }
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
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
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
  int axisCount=1;
  List<Post> items =new List();
  String post_img1="https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964";
  String post_img2="https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(String , img_post: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(String, img_post: post_img2,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(String , img_post: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(String, img_post: post_img2,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(String , img_post: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(String, img_post: post_img2,caption: "Discover more great images on our sponsor's site"));



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Prfile",style: TextStyle(color: Colors.black,fontFamily: "billabong",fontSize: 25),),
      ),
      body:Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [

            //#myphoto
          GestureDetector(
            onTap: (){
              _showPicker(context);
            },
            child:   Stack(
              children: [

                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        width: 1.5,
                        color: Color.fromARGB(252, 175, 69, 1),
                      )
                  ),

                  child:  ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child:Image(
                        image: AssetImage("assets/images/ic_person.png"),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,

                      )
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.add_circle,color: Colors.purple,)
                    ],
                  ),
                )

              ],
            ),
          ),

            //#myinfos
            SizedBox(height: 10,),
            Text("Dilyorbek".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            Text("dilyor@gmail.com",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),

            //#my
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("675",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("Posts",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("300 mln",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("FOLLOWERS",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("675",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("FOLLOWING",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            axisCount = 1;
                          });
                        },
                        icon: Icon(Icons.list_alt),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            axisCount = 2;
                          });
                        },
                        icon: Icon(Icons.grid_view,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
     Expanded(
  child:GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: axisCount),
    itemCount: items.length,
    itemBuilder: (ctx, index){
      return _itemOfPost(items[index]);
    },
  ) ,
)

          ],
        ),
      ),
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      margin: EdgeInsets.all(5),
      child:Column(
        children: [

          Expanded(child:CachedNetworkImage(
            width: double.infinity,
            imageUrl: post.img_post,
            placeholder: (context,url)=>CircularProgressIndicator(),
            errorWidget: (context,url,error)=>Icon(Icons.error),
            fit: BoxFit.cover,
          ) ),
          Text(
            post.caption,
            style: TextStyle(color: Colors.black87.withOpacity(0.7)),
            maxLines: 2,
          ),


        ],
      ) ,
    );
  }
}
