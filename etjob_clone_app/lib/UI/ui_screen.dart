import 'dart:io';


import 'package:etjob_clone_app/UI/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/gestures.dart';

class UiScreenPage extends StatefulWidget {

  @override
  State<UiScreenPage> createState() => _UiScreenPageState();
}

class _UiScreenPageState extends State<UiScreenPage> with TickerProviderStateMixin {
  final _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String? imageUrl;

  void _showImageDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Please choose an Option',),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                _getFromCamera();
              },
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.camera,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _getFromGallery();
              },
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.image,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    );
  }
  void _getFromCamera() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.pop(context);
  }
  void _getFromGallery() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }
  void _cropImage(filePath) async{
    CroppedFile? croppedImage=await ImageCropper().cropImage(sourcePath: filePath,maxHeight: 1080,maxWidth: 1080);
    if(croppedImage != null){
      setState(() {
        imageFile=File(croppedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MySize=MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                    children: [
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showImageDialog();
                                },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.cyanAccent),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: imageFile==null
                                        ? const Icon(Icons.camera_enhance_sharp,color: Colors.cyan,size: 30,)
                                        :Image.file(imageFile!,fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                ),
                SizedBox(height: kPadding - 8,),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'PRIMARY MAILS',
                    style: TextStyle(
                      color: Colors.black54,
                      wordSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: kPadding - 10,),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black26,
                            offset: Offset(2, 0),
                          )
                        ]
                    ),
                    child: Expanded(
                        flex: 1,
                        child: Row(
                            children: [
                              CircleAvatar(
                                child: Text('T')
                              ),
                              SizedBox(width: kPadding - 12,),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Title',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              '4:00 pm',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Description',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const Text(
                                          'Content',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        IconButton(
                                          icon:const Icon(
                                            Icons.menu,
                                            size: 24,
                                            color: Colors.black54,
                                          ),
                                          onPressed: (){},
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Search Here',
                                                focusedBorder: InputBorder.none,
                                                errorBorder:  InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                focusedErrorBorder: InputBorder.none,
                                                isDense: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: imageFile==null
                                                ? const Icon(Icons.camera_enhance_sharp,color: Colors.cyan,size: 30,)
                                                :Image.file(imageFile!,fit: BoxFit.fill,),
                                          ),
                                        )
                                      ]
                                  )
                              )
                            ]
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}
