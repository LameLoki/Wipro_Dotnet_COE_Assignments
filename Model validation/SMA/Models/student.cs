using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SMA.Models
{
    public class Student : IValidatableObject
    {
        public int Id { get; set; }

        public string Name { get; set; } = string.Empty;

        public int Age { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public IEnumerable<ValidationResult> Validate(
            ValidationContext validationContext)
        {
            // 1. Student name should not be empty
            if (string.IsNullOrWhiteSpace(Name))
            {
                yield return new ValidationResult(
                    "Student name cannot be empty.",
                    new[] { nameof(Name) });
            }

            // 2. Student age must be at least 18
            if (Age < 18)
            {
                yield return new ValidationResult(
                    "Age must be 18 or above.",
                    new[] { nameof(Age) });
            }

            // 3. Student age should not be greater than 60
            if (Age > 60)
            {
                yield return new ValidationResult(
                    "Age must not be greater than 60.",
                    new[] { nameof(Age) });
            }

            // 4. Start date should not be in the past
            if (StartDate.Date < DateTime.Today)
            {
                yield return new ValidationResult(
                    "Start date cannot be in the past.",
                    new[] { nameof(StartDate) });
            }

            // 5. End date must be at least 7 days after start date
            if (EndDate < StartDate.AddDays(7))
            {
                yield return new ValidationResult(
                    "End date must be at least 7 days after start date.",
                    new[] { nameof(EndDate) });
            }
        }
    }
}
