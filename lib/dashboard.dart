import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Product"),
      ),
      body: itemCard(),
    );
  }

  Widget itemCard() {
    return Container(
      height: 1800.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                  childAspectRatio: 160.06 / 190.42),
              itemCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // var item = GroceryServices.products[index];
                double discount = (1 / 100);
                double totalDiscount = 1;
                return InkWell(
                  onTap: () {
                    Share.share("https://myshop654.page.link/start",
                        subject: "https://myshop654.page.link/start");
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffFFFDFD),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 97.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                          child: Image.asset(
                            'assets/logo.jpg',
                            width: 80,
                            height: 80,
                          ),
                        ),
                        const SizedBox(
                          height: 11.35,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("product_name",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),
                              const SizedBox(
                                height: 8.65,
                              ),
                              Row(
                                children: const [
                                  Text("category",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8B9E9E),
                                      )),
                                  Spacer(),
                                  Icon(
                                    Icons.star,
                                    size: 14.0,
                                    color: Colors.orange,
                                  ),
                                  Text("4.5",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 22.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 13.2,
                              ),
                              Row(
                                children: [
                                  const Text("price",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff02A88A),
                                      )),
                                  const SizedBox(
                                    width: 6.66,
                                  ),
                                  Text("$totalDiscount",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.lineThrough,
                                        color: Color(0xffF25822),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
