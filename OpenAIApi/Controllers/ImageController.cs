using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OpenAIApi.Services;

namespace OpenAIApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {
        readonly ImageService _imageService;

        public ImageController(ImageService imageService)
        {
            _imageService = imageService;
        }

        [HttpGet(Name = "GetImages")]
        public async Task<IActionResult> GetImagesAsync(String promt)
        {
            var result = await _imageService.MakeImageRequestAsync(promt);

            if (result != null)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }
    }
}
