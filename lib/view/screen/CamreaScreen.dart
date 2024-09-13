import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/state%20management/bloc/translate/translate_cubit_cubit.dart';

class Camera_Screen extends StatefulWidget {
  const Camera_Screen({super.key});

  @override
  State<Camera_Screen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<Camera_Screen> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubdarkColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 400,
                child: Center(
                  child: _image == null
                      ? const Icon(
                          Iconsax.image,
                          color: WhiteColor,
                          size: 100,
                        )
                      : Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const Spacer(),
              _image == null
                  ? SizedBox(
                      height: 110,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              var image = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              setState(() {
                                _image = image;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PrimaryColor,
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width - 16, 50),
                            ),
                            child: Text(
                              S.of(context).camera_2,
                              style: const TextStyle(
                                color: SubColor,
                                fontFamily: SubFont,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              setState(() {
                                _image = image;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(color: PrimaryColor),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width - 16, 50),
                            ),
                            child: Text(
                              S.of(context).camera_1,
                              style: const TextStyle(
                                color: PrimaryColor,
                                fontFamily: SubFont,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        String text =
                            await BlocProvider.of<TranslateCubit>(context)
                                .TranslateFunImage(image: _image!);
                        Navigator.pop(context, text);

                        // Navigator.pop(context, "");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 16, 50),
                      ),
                      child: Text(
                        S.of(context).home_3,
                        style: const TextStyle(
                          color: SubColor,
                          fontFamily: SubFont,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
