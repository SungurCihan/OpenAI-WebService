import 'package:openai_mobile/home/model/image_request_model.dart';
import 'package:vexana/vexana.dart';

abstract class IImageService {
  late final INetworkManager _networkManager;

  IImageService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<INetworkModel?> getImages(String promt);
}

class ImageManager extends IImageService {
  ImageManager(INetworkManager networkManager) : super(networkManager);

  @override
  Future<INetworkModel?> getImages(String promt) async {
    try {
      final response =
          await _networkManager.send<ImageRequestModel, ImageRequestModel>(
        'https://openaiapisungur.azurewebsites.net/api/Image?promt=$promt',
        parseModel: ImageRequestModel(),
        method: RequestType.GET,
        //data: promt
      );

      return response.data is ImageRequestModel ? response.data : null;
    } catch (e) {
      print(e);
    }
  }
}
