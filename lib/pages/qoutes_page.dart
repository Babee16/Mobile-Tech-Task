import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtt/others/size_config.dart';
import 'package:mtt/services/api.dart';
import 'package:mtt/widgets/qoute_of_the_day.dart';
import 'package:mtt/widgets/qoutes_widget.dart';
import 'package:provider/provider.dart';

class QoutesPage extends StatefulWidget {
  static const routeName = '/qoutes-page';
  const QoutesPage({Key? key}) : super(key: key);

  @override
  State<QoutesPage> createState() => _QoutesPageState();
}

class _QoutesPageState extends State<QoutesPage> {
  var isInit = true;
  var isLoading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isInit) {
        isInit = false;

        try {
          Provider.of<API>(context, listen: false)
              .getQouteOfTheDay()
              .then((value) {
            print('done qoute of the day');
            Provider.of<API>(context, listen: false).getQoutes().then((value) {
              print('done qoutes');
              isLoading = false;
            });
          });
        } catch (e) {
          print('error: ${e.toString()}');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<API>(context, listen: true);
    SizeConfig().init(context);
    var scaffoldKey = GlobalKey<ScaffoldState>();

    final mediaQueryData = MediaQuery.of(context);
    var qoutes = api.qoutes;
    var qouteOfTheDay = api.qouteOfTheDay;
    var related = qoutes.thought!.relatedThemeThoughts;

    Future<void> refresh() async {}
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: .8),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: true,
          body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  Text(
                    'Daily Wisdom',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical! * 4,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : QouteOfTheDayWidget(
                          cp: qouteOfTheDay
                              .promotedContent!.contentPositions!.first,
                        ),
                  Text(
                    'Qoutes About',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical! * 4,
                    ),
                  ),
                  Text(
                    '${qoutes.thought!.thoughtThemes!.first.name}',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical! * 4,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  CarouselSlider.builder(
                    itemCount: related!.length,
                    options: CarouselOptions(
                      viewportFraction: .99,
                      height: SizeConfig.blockSizeVertical! * 35,
                      autoPlay: false,
                      aspectRatio: 4,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      // disableCenter: false,
                      // padEnds: false,
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Column(
                        children: [
                          QoutesWidget(
                            qoute: related[index].quote!,
                            author: related[index].thoughtAuthor!.name!,
                            image: '',
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      );
                    },
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
