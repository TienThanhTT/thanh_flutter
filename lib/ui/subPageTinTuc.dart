import 'package:connection/providers/mainViewModel.dart';
import 'package:connection/ui/AppConstant.dart';
import 'package:flutter/material.dart';

class SubPageTinTuc extends StatelessWidget {
  const SubPageTinTuc({super.key});
  static int idPage = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
          color: AppConstant.secondaryColor,
          child: Center(
            child: Text("Tin tức", style: TextStyle(color: const Color.fromARGB(255, 14, 13, 13)),),
          )),
    );
  }
}

