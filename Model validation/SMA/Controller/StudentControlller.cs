using Microsoft.AspNetCore.Mvc;
using SMA.Models;

namespace SMA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        [HttpPost]
        public IActionResult AddStudent(Student student)
        {
            return Ok("Student added successfully.");
        }
    }
}
