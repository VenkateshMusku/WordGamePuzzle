<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question6.aspx.cs" Inherits="WordGamePuzzle.Question6" %>

<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-dark table-hover">
        <tr>
            <td class="table-dark">
                <p>
                    Fill in the blank space with four words that you think is relevant to the word 
                    shown below.
                </p>
            </td>
        </tr>

        <tr>
            <td class="table-dark">
                <asp:Label ID="lblWord1" runat="server"></asp:Label>
                <asp:TextBox ID="txtWord1" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtWord2" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtWord3" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtWord4" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" />
                <asp:RequiredFieldValidator ID="cvword1" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord1">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="cvword2" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord2">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="cvword3" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord3">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="cvword4" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord4">
                </asp:RequiredFieldValidator>
            </td>
        </tr>

    </table>
</asp:Content>
