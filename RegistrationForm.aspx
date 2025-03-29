<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Bowandbaan_task.RegistrationForm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-primary {
            border-radius: 8px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="MainForm" runat="server">
        <div class="container vh-100 d-flex justify-content-center align-items-center">
            <div class="col-md-5">
                <div class="card p-4 bg-white">
                    <h3 class="mb-4 text-center fw-bold text-primary">Registration Form</h3>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">First Name:</label>
                        <asp:TextBox ID="FirstName" runat="server" CssClass="form-control" placeholder="Enter your first name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdFirstName" runat="server" ControlToValidate="FirstName" 
                            ErrorMessage="First Name is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Last Name:</label>
                        <asp:TextBox ID="LastName" runat="server" CssClass="form-control" placeholder="Enter your last name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdLastName" runat="server" ControlToValidate="LastName" 
                            ErrorMessage="Last Name is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email:</label>
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdEmail" runat="server" ControlToValidate="Email" 
                            ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email"
                            ValidationExpression="^[^@]+@[^@]+\.[^@]+$" ErrorMessage="Invalid email format." 
                            ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Password:</label>
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdPassword" runat="server" ControlToValidate="Password" 
                            ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Confirm Password:</label>
                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdConfirmPassword" runat="server" ControlToValidate="ConfirmPassword" 
                            ErrorMessage="Confirm Password is required." ForeColor="Red" Display="Dynamic" />
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="ConfirmPassword" 
                            ControlToCompare="Password" ErrorMessage="Passwords do not match." 
                            ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Date of Birth:</label>
                        <asp:TextBox ID="DateOfBirth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RqdDOB" runat="server" ControlToValidate="DateOfBirth" 
                            ErrorMessage="Date of Birth is required." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="mb-3 text-danger text-center">
                        <asp:Label ID="ErrorMessages" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary w-100" Text="Register" OnClick="RegisterButton_Click" />
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
