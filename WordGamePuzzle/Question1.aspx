<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Question1.aspx.cs" Inherits="WordGamePuzzle.Question1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <p>Fill in the blan space with a word that you think is relevant to the word 
                    shown below.
                </p>
            </div>
        </div>
        
            <div class="row">
               <div class ="col">
                <asp:Label ID="lblWord1" runat="server"></asp:Label>
                   </div>
                <div class ="col">
                <asp:TextBox ID="txtWord1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="cvword1" runat="server" ErrorMessage="Please enter a valid english word" ForeColor="Red" ControlToValidate ="txtWord1">

                </asp:RequiredFieldValidator>
                    </div>
               
            </div>

        <div class ="row">

            <asp:Button ID="btn_Next" runat="server" OnClick="btn_Next_Click" Text="Next" />
            <asp:CustomValidator ID="cvValidEnglishWordValidator" runat="server"  ErrorMessage="Please enter a valid english word" ForeColor="Red" OnServerValidate="cvValidEnglishWordValidator_ServerValidate"></asp:CustomValidator>

        </div>
    
    </form>
</body>
</html>
