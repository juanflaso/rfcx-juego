using Microsoft.AspNetCore.Mvc;
using WebApplication.IRepository;
using System.Threading.Tasks;
using WebApplication.Models;
using Newtonsoft.Json;
using System;

namespace WebApplication.Controllers
{
    [Route("api/bpv/[controller]")]
    public class PhotoController
    {
        
        private readonly IPhotoRepository _PhotoRepository;

        public PhotoController(IPhotoRepository PhotoRepository)
        {
            _PhotoRepository=PhotoRepository;
        }

        [HttpGet()]
        public Task<string> Get()
        {
            return this.GetPhoto();
        }

        private async Task<string> GetPhoto()
        {
            var Photo= _PhotoRepository.Get();
            return JsonConvert.SerializeObject(Photo);
        }

        [HttpGet("{id:int}")]
        public Task<string> Get(int id)
        {
            return this.GetPhotoByIdInt(id);
        }

        private async Task<string> GetPhotoByIdInt(int id)
        {
            var Photo= await _PhotoRepository.Get(id) ?? new Photo();
            return JsonConvert.SerializeObject(Photo);
        }

        [HttpDelete("{id:int}")]
        public bool Delete(int id)
        {
            bool valor = _PhotoRepository.Remove(id);
            return true;
        }

    }

}