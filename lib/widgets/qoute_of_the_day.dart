import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtt/models/qoute_of_the_day_model.dart';
import 'package:mtt/others/size_config.dart';

class QouteOfTheDayWidget extends StatefulWidget {
  final ContentPosition cp;
  const QouteOfTheDayWidget({
    Key? key,
    required this.cp,
  }) : super(key: key);

  @override
  State<QouteOfTheDayWidget> createState() => _QouteOfTheDayWidgetState();
}

class _QouteOfTheDayWidgetState extends State<QouteOfTheDayWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: SizeConfig.blockSizeVertical! * 10,
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                widget.cp.description ?? '-',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical! * 3,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            // top: 8.0,
            left: 24.0,
          ),
          child: FaIcon(
            FontAwesomeIcons.quoteLeft,
            size: SizeConfig.blockSizeVertical! * 4,
          ),
        ),
        Positioned(
          bottom: SizeConfig.blockSizeVertical! * 4,
          left: SizeConfig.blockSizeHorizontal! * 10,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: widget.cp.image ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.cp.authors!.first.name ?? '-',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical! * 3,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
