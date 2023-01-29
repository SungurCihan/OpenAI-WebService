import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_mobile/home/service/image_service.dart';

import '../model/image_request_model.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final TextEditingController promtController;
  final IImageService imageService;

  ImageCubit(this.promtController, {required this.imageService})
      : super(const ImageState());

  Future<void> getImages() async {
    _changeLoading();
    final result = await imageService.getImages(promtController.text);
    _changeLoading();

    if (result is ImageRequestModel) {
      emit(state.copyWith(imageRequestModel: result));
    }
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  void changeCurrentIndex(value) {
    emit(state.copyWith(currentIndex: value));
  }
}
