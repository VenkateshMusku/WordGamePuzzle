<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Question1.aspx.cs" Inherits="WordGamePuzzle.Question1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <table class="table table-dark table-hover">
        <tr>
            <td class="table-dark">
                <p>&nbsp;</p>
                <p>
                    Fill in the blank space with a word that you think is relevant to the word 
                    shown below.
                </p>
            </td>
        </tr>


        <tr>
            <td class="table-dark">
                <asp:Label ID="lblWord1" runat="server"></asp:Label>


                <asp:TextBox ID="txtWord1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="cvword1" runat="server" ErrorMessage="Please enter a valid english word" ForeColor="Red" ControlToValidate="txtWord1">

                </asp:RequiredFieldValidator>

            </td>

        </tr>
        <tr>
            <td class=" table table-dark table-hover">

                <br />

            </td>
        </tr>


        <tr>
            <td class="table-dark" colspan="3">
                <asp:Button ID="btn_Next" runat="server" OnClick="btn_Next_Click" Text="Next" />
                <asp:CustomValidator ID="cvValidEnglishWordValidator" runat="server" ErrorMessage="Please enter a valid english word" ForeColor="Red" OnServerValidate="cvValidEnglishWordValidator_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
    </table>

</asp:Content>
