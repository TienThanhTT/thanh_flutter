import 'package:connection/ui/AppConstant.dart';
import 'package:flutter/material.dart';

import '../models/lop.dart';
import '../models/profile.dart';
import '../providers/mainViewModel.dart';
import '../repositories/lop_repository.dart';


class SubPageDsLop extends StatelessWidget {
  const SubPageDsLop({super.key});
  static int idPage = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstant.secondaryColor,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Danh Sách Lớp',
              style: TextStyle(
                color: Color.fromARGB(255, 6, 27, 146),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 300 ,
            child: FutureBuilder<List<Dssv>>(
              future: LopRepository().getDssv(Profile().student.idLop),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Hiển thị loading khi đang fetch dữ liệu
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Xây dựng giao diện sử dụng dữ liệu từ API
                  List<Dssv> dataList = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        'Tổng SV : ${dataList.length}',
                        
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height - 343,
                        width: double.infinity,
                        child: GridView.builder(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500,
                            childAspectRatio: 6,
                            mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                          ),
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height - 100 ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 71, 160, 248),
                              ),

                              child: Padding(

                                padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            dataList[index].first_name,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 7, 0, 81),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            dataList[index].mssv,
                                            style: const TextStyle(
                                                color:
                                                    Color.fromARGB(255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          
                        ),
                      ),
                    ],
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