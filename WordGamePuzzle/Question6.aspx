<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question6.aspx.cs" Inherits="WordGamePuzzle.Question6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="mb-3">
                <p>Fill in the blank space with four words that you think is relevant to the word 
                    shown below.
                </p>
            </div>
        </div>
             <div class="container">
            <div class="row">
               <div class ="col">
                <asp:Label ID="lblWord1" runat="server"></asp:Label>
                   </div>
                <div class ="col">
                <asp:TextBox ID="txtWord1" runat="server"></asp:TextBox>
                 <asp:TextBox ID="txtWord2" runat="server"></asp:TextBox>
                 <asp:TextBox ID="txtWord3" runat="server"></asp:TextBox>
                 <asp:TextBox ID="txtWord4" runat="server"></asp:TextBox>
                    </div>

               
            </div>
                 </div>

        <div class ="row">

            <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" />
           <asp:RequiredFieldValidator ID="cvword1" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate ="txtWord1">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="cvword2" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate ="txtWord2">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="cvword3" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate ="txtWord3">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="cvword4" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate ="txtWord4">
            </asp:RequiredFieldValidator>
             <asp:CustomValidator ID="cvValidEnglishWordValidator" runat="server"  ErrorMessage="Please enter a valid english word" ForeColor="Red" OnServerValidate="cvValidEnglishWordValidator_ServerValidate" ></asp:CustomValidator>
        </div>
    
    </form>
</body>
</html>
