import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superbuyy/inner_screens/product_details.dart';
import 'package:superbuyy/services/global_methods.dart';
import 'package:superbuyy/services/utils.dart';
import 'package:superbuyy/widgets/heart_btn.dart';
import 'package:superbuyy/widgets/price_widget.dart';
import 'package:superbuyy/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  double get kgValue {
    if (_quantityTextController.text.isEmpty) {
      return 0.0;
    }
    try {
      return double.parse(_quantityTextController.text);
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {
              GlobalMethods.navigateTo(
                  ctx: context, routeName: ProductDetails.routName);
            },
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: size.width * 0.21 + 115,
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    height: size.width * 0.21,
                    width: size.width * 0.2,
                    boxFit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Title',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const HeartBTN(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: PriceWidget(
                            salePrice: 3.99,
                            price: 5.6,
                            textPrice: kgValue.toString(),
                            isOnSale: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              FittedBox(
                                child: TextWidget(
                                  text: 'KG',
                                  color: color,
                                  textSize: 18,
                                  isTitle: true,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: TextFormField(
                                  controller: _quantityTextController,
                                  key: const ValueKey('10'),
                                  style: TextStyle(color: color, fontSize: 18),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  maxLines: 1,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}$'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        text: 'Add to cart',
                        maxLines: 1,
                        color: color,
                        textSize: 20,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).cardColor),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
