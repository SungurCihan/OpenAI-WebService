import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:openai_mobile/core/extensions/context_extensions.dart';
import 'package:vexana/vexana.dart';

import '../../core/constants/application_constants.dart';
import '../../core/utilities/image_circle.dart';
import '../../core/utilities/pink_button.dart';
import '../cubit/image_cubit.dart';
import '../model/image_request_model.dart';
import '../service/image_service.dart';

class HomeView extends StatelessWidget {
  final TextEditingController promtController = TextEditingController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(promtController,
          imageService: ImageManager(
              NetworkManager<ImageRequestModel>(options: BaseOptions()))),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: _topSide(),
            ),
            Expanded(
              flex: 6,
              child: _imageSide(),
            )
          ],
        ),
      )),
    );
  }

  BlocConsumer<ImageCubit, ImageState> _topSide() {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _textField(context),
            _button(state, context),
          ],
        );
      },
    );
  }

  Container _textField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: context.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(ApplicationConstants.radius * 2)),
      height: context.height * 5.5,
      child: Padding(
        padding: context.paddingMediumLeft,
        child: TextFormField(
          controller: promtController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ApplicationConstants.radius),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ApplicationConstants.radius),
                borderSide: const BorderSide(color: Color(0xffFF007F))),
            fillColor: context.colorScheme.background,
            suffixIcon: Icon(IconlyLight.search,
                color: context.colorScheme.onSecondary),
            hintText: 'Resmi Tasvir Ediniz',
          ),
        ),
      ),
    );
  }

  PinkButton _button(ImageState state, BuildContext context) {
    return PinkButton(
      child: state.isLoading == true
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text(
              'Resimleri Getir',
              style: TextStyle(color: Colors.white),
            ),
      onTap: () {
        context.read<ImageCubit>().getImages();
      },
    );
  }

  BlocBuilder<ImageCubit, ImageState> _imageSide() {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        List<String> images = [
          state.imageRequestModel?.image1 ?? "",
          state.imageRequestModel?.image2 ?? "",
          state.imageRequestModel?.image3 ?? "",
          state.imageRequestModel?.image4 ?? "",
          state.imageRequestModel?.image5 ?? "",
        ];

        return Column(
          children: [
            Expanded(
              flex: 5,
              child: _images(images, context),
            ),
            Expanded(
              flex: 2,
              child: _circles(images),
            )
          ],
        );
      },
    );
  }

  PageView _images(List<String> images, BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      onPageChanged: (value) {
        context.read<ImageCubit>().changeCurrentIndex(value);
      },
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ApplicationConstants.radius),
              ),
              image: DecorationImage(
                  image: NetworkImage(images[index]), fit: BoxFit.cover)),
        );
      },
    );
  }

  Center _circles(List<String> images) {
    return Center(
      child: ListView.builder(
        itemCount: images.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              return ImageCircle(isSelected: state.currentIndex == index);
            },
          );
        },
      ),
    );
  }
}
