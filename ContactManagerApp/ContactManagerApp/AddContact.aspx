<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddContact.aspx.cs" Inherits="ContactManagerApp.AddContact" %>
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
        <div class="logout" style="display:flex;justify-content:flex-end;padding:0px 10px;font-size:12px">
            <asp:LinkButton ID="LinkButtonLogout" Text="LogOut" runat="server" OnClick="LinkButtonLogout_Click">Logout </asp:LinkButton> <asp:Label ID="emailtext" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HiddenFieldUserID" runat="server" />
        </div>
        <div class="formcon2">
            <h2 class="sign">Contact Form and Contact List Page</h2>
            <h4>Add Contact</h4>
            <div class="mb-3 item">
                <label class="form-label">Name <span class="text-danger">*</span></label>
                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Name is Required" ControlToValidate="TextBoxName" ForeColor="Red" ValidationGroup="AddContact" Display="Dynamic" SetFocusOnError="True" Font-Size="12px"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3 item">
                <label class="form-label">Ph No <span class="text-danger">*</span></label>
                <asp:TextBox ID="TextBoxPhNo" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhNo" runat="server" ErrorMessage="Ph No is Required" ControlToValidate="TextBoxPhNo" ForeColor="Red" ValidationGroup="AddContact" Display="Dynamic" Font-Size="12px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhNo" runat="server" ErrorMessage="Please enter valid Ph no" ControlToValidate="TextBoxPhNo" ForeColor="Red" ValidationGroup="AddContact" Display="Dynamic" SetFocusOnError="True" Font-Size="12px" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </div>
            <div class="mb-3 item">
                <label class="form-label">Email <span class="text-danger">*</span></label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="TextBoxEmail" ForeColor="Red" ValidationGroup="AddContact" Display="Dynamic" SetFocusOnError="True" Font-Size="12px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please enter valid email" ControlToValidate="TextBoxEmail" ForeColor="Red" ValidationGroup="AddContact" Display="Dynamic" SetFocusOnError="True" Font-Size="12px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <asp:Button ID="savecontact" runat="server" Text="Save" CssClass="btn btn-primary savebtn" ValidationGroup="AddContact" OnClick="savecontact_Click" />
            <h4 class="mycontact">My Contact</h4>
            <asp:GridView ID="GridView_Contact" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" BorderStyle="Solid" BorderWidth="1px" CssClass="contact_Grid" Width="800px">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="Contact_ID" HeaderText="ID" Visible="false" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Contact_Name" HeaderText="Name" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" ItemStyle-Height="50px" HeaderStyle-Width="150px" HeaderStyle-Height="50px" FooterStyle-BorderStyle="Solid" FooterStyle-BorderWidth="1px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Contact_Phno" HeaderText="Ph No" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" ItemStyle-Height="50px" HeaderStyle-Width="150px" HeaderStyle-Height="50px" FooterStyle-BorderStyle="Solid" FooterStyle-BorderWidth="1px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Contact_Email" HeaderText="Email" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" ItemStyle-Height="50px" HeaderStyle-Width="150px" HeaderStyle-Height="50px" FooterStyle-BorderStyle="Solid" FooterStyle-BorderWidth="1px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                </Columns>
                <EmptyDataTemplate>
                    <div id="norec" class="no-record-msg">
                        <table border="0" cellpadding="0" cellspacing="0" height="36" width="100%">
                            <tr>
                                <td class="data-grid-header" style="width: 18px"></td>
                                <td width="11"></td>
                                <td width="689">No Record(s) Found!</td>
                            </tr>
                        </table>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
