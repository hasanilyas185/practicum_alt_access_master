import 'dart:io';

import 'package:alt_access/styling/constants.dart';
import 'package:alt_access/ui/admin_home/admin_home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../widgets/side_drawer.dart';

class FileDirectory extends StatefulWidget {
  const FileDirectory({
    Key? key,
    this.maxValue = 0,
    this.minValue = 0,
    this.fileName = "Filename",
    this.filePath = "",
  }) : super(key: key);
  final int? maxValue;
  final int? minValue;
  final String? fileName;
  final String? filePath;

  @override
  FileDirectoryState createState() => FileDirectoryState();
}

class FileDirectoryState extends State<FileDirectory>
    with TickerProviderStateMixin {
  final controller = TextEditingController();
  var minValueShow = 0;

  @override
  void initState() {
    super.initState();
    minValueShow = widget.minValue!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "File Directory",
          style: TextStyle(color: Constants.Black),
        ),
        backgroundColor: Constants.lightPrimary,
        elevation: 5,
        // scrolledUnderElevation: scrolledUnderElevation,
        //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
      ),
      drawer: SideDrawer(
          login: true,
          press: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AdminHome()));
          }),
      backgroundColor: Constants.lightPrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildTextField(context,
                      isOnTap: true, tempFileName: widget.fileName!),
                  Row(
                    children: [
                      const Text(
                        "Min agents required to unlock: ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${minValueShow.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Max shares created : ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${widget.maxValue.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  buildTextField(context, tempFileName: "abc"),
                  Row(
                    children: const [
                      Text(
                        "Min agents required to unlock: ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "4",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Max shares created : ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${widget.maxValue.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  buildTextField(context),
                  Row(
                    children: [
                      const Text(
                        "Min agents required to unlock: ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${minValueShow.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Max shares created : ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${widget.maxValue.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  buildTextField(context),
                  Row(
                    children: [
                      const Text(
                        "Min agents required to unlock: ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${minValueShow.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Max shares created : ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${widget.maxValue.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  buildTextField(context),
                  Row(
                    children: [
                      const Text(
                        "Min agents required to unlock: ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${minValueShow.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Max shares created : ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        "${widget.maxValue.toString()} ",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (minValueShow == 0 && !widget.filePath!.contains("pdf"))
              GestureDetector(
                onTap: () {
                  minValueShow = widget.minValue!;
                  setState(() {});
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                          File(widget.filePath!),
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context,
          {isOnTap = false, String tempFileName = ""}) =>
      TextField(
        onTap: () {
          if (isOnTap) {
            if (widget.filePath!.contains("pdf") && minValueShow == 0) {
              OpenFile.open(widget.filePath);
            }

            if (minValueShow != 0) {
              minValueShow = minValueShow - 1;
              setState(() {});
            }
          }
        },
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white30,
          hintText: tempFileName,
          hintStyle: const TextStyle(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black54,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white30)),
          contentPadding: const EdgeInsets.all(20.0),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
