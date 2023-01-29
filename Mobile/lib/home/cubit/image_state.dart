part of 'image_cubit.dart';

class ImageState extends Equatable {
  final bool? isLoading;
  final ImageRequestModel? imageRequestModel;
  final int currentIndex;

  const ImageState(
      {this.isLoading, this.imageRequestModel, this.currentIndex = 0});

  @override
  List<Object?> get props => [isLoading, imageRequestModel, currentIndex];

  ImageState copyWith(
      {bool? isLoading,
      ImageRequestModel? imageRequestModel,
      int? currentIndex}) {
    return ImageState(
        isLoading: isLoading ?? this.isLoading,
        imageRequestModel: imageRequestModel ?? this.imageRequestModel,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}
