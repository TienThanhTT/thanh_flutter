import 'package:connection/providers/mainViewModel.dart';
import 'package:flutter/material.dart';

import '../models/hocphan.dart';
import '../repositories/hocphan_repository.dart';
import 'AppConstant.dart';

class SubPageDsHocPhan extends StatelessWidget {
  const SubPageDsHocPhan({super.key});
  static int idPage = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstant.secondaryColor,

      child: Column(

        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Danh Sách Học Phần',
              style: TextStyle(
                color: Color.fromARGB(255, 47, 244, 47),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: FutureBuilder<List<HocPhan>>(
              future: HocPhanRepository().get_ds_hocphan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Hiển thị loading khi đang fetch dữ liệu
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Xây dựng giao diện sử dụng dữ liệu từ API
                  List<HocPhan> dataList = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 71, 160, 248),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,

                                    dataList[index].tenhocphan,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    dataList[index].tengv,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 238, 220, 28),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}