<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question3.aspx.cs" Inherits="WordGamePuzzle.Question3" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


    <table class="table table-dark table-hover">
        <tr>
            <td class="table-dark">
                <p>
                    Fill in the blank space with two words that you think is relevant to the word 
                    shown below.
                </p>
            </td>
        </tr>


        <tr>
            <td class="table-dark">
                <asp:Label ID="lblWord1" runat="server"></asp:Label>
                <asp:TextBox ID="txtWord1" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtWord2" runat="server"></asp:TextBox>
            </td>


        </tr>

        <tr>
            <td class="table-dark">
                <asp:Button ID="btn_Next" runat="server" OnClick="btn_Next_Click" Text="Next" />

                <asp:RequiredFieldValidator ID="cvword1" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord1">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="cvword2" runat="server" ErrorMessage="Please select a valid english word" ForeColor="Red" ControlToValidate="txtWord2">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvValidEnglishWordValidator" runat="server" ErrorMessage="Please enter a valid english word" ForeColor="Red" OnServerValidate="cvValidEnglishWordValidator_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>

    </table>

</asp:Content>
