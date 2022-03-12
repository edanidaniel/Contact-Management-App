<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ContactManagerApp.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="CSS/main.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formcon">
            <h2 class="sign">Sign In</h2>
            <label class="account">Don't have an account? <a href="Signup.aspx" class="text-primary">Sign Up</a></label>
            <div class="mb-3 item">
                <label class="form-label">Email <span class="text-danger">*</span></label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="TextBoxEmail" ForeColor="Red" ValidationGroup="signin" Display="Dynamic" SetFocusOnError="True" Font-Size="12px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please enter valid email" ControlToValidate="TextBoxEmail" ForeColor="Red" ValidationGroup="signin" Display="Dynamic" SetFocusOnError="True" Font-Size="12px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="mb-3 item">
                <label class="form-label">Password <span class="text-danger">*</span></label>
                <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password is Required" ControlToValidate="TextBoxPassword" ForeColor="Red" ValidationGroup="signin" Display="Dynamic" Font-Size="12px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ErrorMessage="Please enter At least 8 characters length" ControlToValidate="TextBoxPassword" ForeColor="Red" ValidationGroup="signin" Display="Dynamic" SetFocusOnError="True" Font-Size="12px" ValidationExpression=".{8,}"></asp:RegularExpressionValidator>
            </div>
            <label class="text-primary forgot">Forgot Your Password?</label>
            <asp:Button ID="signin" runat="server" Text="Sign In" CssClass="btn btn-primary loginbtn" ValidationGroup="signin" OnClick="signin_Click"/>
        </div>
    </form>
</body>
</html>
