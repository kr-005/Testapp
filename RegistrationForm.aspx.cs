using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Bowandbaan_task
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorMessages.Text = "";
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string firstName = FirstName.Text.Trim();
            string lastName = LastName.Text.Trim();
            string email = Email.Text.Trim();
            string password = Password.Text.Trim();
            string confirmPassword = ConfirmPassword.Text.Trim();
            string dobInput = DateOfBirth.Text.Trim();
            DateTime dob;
            string errorMessage = "";

            if (string.IsNullOrEmpty(firstName))
                errorMessage += "First Name is required.<br>";
            if (string.IsNullOrEmpty(lastName))
                errorMessage += "Last Name is required.<br>";

            if (string.IsNullOrEmpty(email))
            {
                errorMessage += "Email is required.<br>";
            }
            else if (!Regex.IsMatch(email, @"^[^@]+@[^@]+\.[^@]+$"))
            {
                errorMessage += "Invalid Email Format.<br>";
            }

            if (string.IsNullOrEmpty(password))
            {
                errorMessage += "Password is required.<br>";
            }
            else if (password.Length < 6)
            {
                errorMessage += "Password must be at least 6 characters long.<br>";
            }
            else if (!Regex.IsMatch(password, @"[A-Z]")) 
            {
                errorMessage += "Password must contain at least one uppercase letter.<br>";
            }
            else if (!Regex.IsMatch(password, @"[0-9]")) 
            {
                errorMessage += "Password must contain at least one number.<br>";
            }

            if (password != confirmPassword)
                errorMessage += "Passwords Must match.<br>";

            if (string.IsNullOrEmpty(dobInput) || !DateTime.TryParse(dobInput, out dob))
            {
                errorMessage += "Invalid Date of Birth.<br>";
            }
            else
            {
                int age = DateTime.Now.Year - dob.Year;
                if (dob > DateTime.Now.AddYears(-age)) age--;   

                if (age < 18)
                    errorMessage += "Must be 18 Year Old.<br>";
            }
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ErrorMessages.Text = $"<span style='color:red;'>{errorMessage}</span>";
            }
            else
            {
                ErrorMessages.Text = "<span style='color:green;'>Registration Successful!</span>";
            }
        }
    }
}
