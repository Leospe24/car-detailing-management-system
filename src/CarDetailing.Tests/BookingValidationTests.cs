using Microsoft.VisualStudio.TestTools.UnitTesting;
using CarDetailing.Models;

namespace CarDetailing.Tests
{
    [TestClass]
    public class BookingValidationTests
    {
        [TestMethod]
        public void ValidateAppointment_ShouldReturnFalse_WhenTimeSlotIsTaken()
        {
            // 1. ARRANGE (Setup the data)
            var existingAppointment = new Appointment { Date = new DateTime(2026, 2, 10, 10, 0, 0) };
            var newRequest = new Appointment { Date = new DateTime(2026, 2, 10, 10, 0, 0) };
            var scheduler = new AppointmentService();

            // 2. ACT (Execute the logic)
            bool isAvailable = scheduler.CheckAvailability(existingAppointment, newRequest);

            // 3. ASSERT (Verify the outcome)
            Assert.IsFalse(isAvailable, "The system should reject overlapping time slots.");
        }
    }
}