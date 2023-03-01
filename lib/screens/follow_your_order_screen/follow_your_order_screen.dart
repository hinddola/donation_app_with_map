import 'dart:io';
import 'package:donation_app_with_map/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File ?selectedImage;

class FollowYourOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: K.primaryColor,
          title: const Center(
            child: Text(
                'تتبع الطلب'
            ),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: K.black12Color,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffDDDDDD),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: K.black12Color
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                10)
                                        ),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '21/38 - 2023.1.23',
                                              style: TextStyle(
                                                color: K.redColor,

                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              ' :التاريخ ',
                                              style: TextStyle(
                                                  color: K.blackColor,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),

                                          ],
                                        ),

                                      ),

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                '55 ',
                                                style: TextStyle(
                                                    color: K.blackColor,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                ' :عدد القطع ',
                                                style: TextStyle(
                                                    color: K.blackColor,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                ' Success ',
                                                style: TextStyle(
                                                    color: K.primaryColor,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                ' :الحالة ',
                                                style: TextStyle(
                                                    color: K.blackColor,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                child: InkWell(
                                    onTap: () {
                                      pickImageFunc();
                                    },
                                    child: selectedImage == null ?
                                    Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThGnzqP2A8anXXPUVtVHg828_lWK3QMwAFSUq8FmVMMyfqCf5SmOLNLkajY5b39D8VY1s&usqp=CAU'
                                    ) : Image.file(
                                      selectedImage!,
                                      fit: BoxFit.fill,

                                    )
                                ),
                              )

                            ],
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  print('Pressed');
                                },
                                child: Text(
                                  'التفاصيل',
                                  style: TextStyle(
                                      color: K.wightColor
                                  ),
                                ),
                                color: K.primaryColor,
                                elevation: 5,
                                minWidth: K.buttonWidth,

                              ),
                              MaterialButton(
                                onPressed: () {
                                  print('Pressed222');
                                },
                                child: Text(
                                  'الغاء',
                                  style: TextStyle(
                                      color: K.primaryColor
                                  ),
                                ),
                                color: K.wightColor,
                                elevation: 5,
                                minWidth: K.buttonWidth,

                              ),


                            ],
                          ),

                        ],
                      ),
                    )
                ),
              );
            }
        )
    );
  }


  pickImageFunc() async {
    //await ImagePicker().getImage(source: source)
    final image1 = await ImagePicker().pickImage(
        source: ImageSource.gallery); //
    selectedImage = File(image1!.path);
  }


}
