using OpenAI.GPT3.Interfaces;
using OpenAI.GPT3.Managers;
using OpenAI.GPT3.ObjectModels.RequestModels;
using OpenAI.GPT3.ObjectModels.ResponseModels.ImageResponseModel;
using OpenAI.GPT3.ObjectModels;
using OpenAIApi.Model;

namespace OpenAIApi.Services
{
    public class ImageService
    {

        readonly IOpenAIService _openApiService;

        public ImageService(IOpenAIService openApiService)
        {
            _openApiService = openApiService;
        }

        public async Task<ImageResponseModel> MakeImageRequestAsync (String prompt)
        {
            List<String> imageUrls = new List<String>();
            ImageResponseModel imageResponseModel = new ImageResponseModel();
            imageResponseModel.Images = imageUrls;

            ImageCreateResponse result = await _openApiService.Image.CreateImage(new ImageCreateRequest()
            {
                Prompt = prompt,
                N = 5,
                Size = StaticValues.ImageStatics.Size.Size1024,
                ResponseFormat = StaticValues.ImageStatics.ResponseFormat.Url,
                User = "Sungur"
            });

            foreach (var item in result.Results)
            {
                imageUrls.Add(item.Url);
            }

            return imageResponseModel;


        }
    }
}
