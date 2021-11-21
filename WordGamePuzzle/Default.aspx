<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WordGamePuzzle._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <table class="table table-dark table-hover">
        <tr>
            <td class="table-dark">
            <p>
                &nbsp;To Which Gender Identity, Do You Identify The Most ?
            </p>
           
        </td>
             </tr>
           
        <tr>
        <td class="table-dark" colspan="1" >
        <asp:RadioButton ID="rdbMale" runat="server" Text="Male" GroupName="GenderGroup" />
        <asp:RadioButton ID="rdbFemale" runat="server" Text="Female" GroupName="GenderGroup" />
        <asp:RadioButton ID="rdbOther" runat="server" Text="Other" GroupName="GenderGroup" />
        <asp:RadioButton ID="rdbNotDisclosed" runat="server" Text="Not Disclosed" GroupName="GenderGroup" />
             
        <asp:CustomValidator ID="cvgenderValidator" runat="server" ForeColor="Red" ErrorMessage="Please select at least one option from Gender" OnServerValidate="cvgenderValidator_ServerValidate"></asp:CustomValidator>
             
         </td>
       </tr>
       
           <tr>
              <td class="table-dark">
            <p>
               How would you describe yourself ?
            </p>
             </td>
           
          </tr>
        <tr>
         <td class="table-dark">
        <asp:RadioButton ID="rdbAfricanAmerican" runat="server" Text="African-American" GroupName="RaceGroup"  />
        <asp:RadioButton ID="rdbWhite" runat="server" Text="White" GroupName="RaceGroup" />
        <asp:RadioButton ID="rdbAsian" runat="server" Text="Asian" GroupName="RaceGroup" />
        <asp:RadioButton ID="rdbAmericanIndian" runat="server" Text="American Indian or Alaska Native" GroupName="RaceGroup" />
        <asp:RadioButton ID="rdbNativeHawaiian" runat="server" Text="Native Hawaiian or Pacific Islander" GroupName="RaceGroup" />
        <asp:RadioButton ID="rdbOtherRace" runat="server" Text="Other" GroupName="RaceGroup" />
        <asp:RadioButton ID="rdbRaceNotDisclosed" runat="server" Text="Prefer Not to Answer" GroupName="RaceGroup" />
        <asp:CustomValidator ID="cvRaceValidator" runat="server" ForeColor ="Red" ErrorMessage="Please select at least one race option" OnServerValidate="cvRaceValidator_ServerValidate"></asp:CustomValidator>
           </td>
             </tr>  
         <tr>
             <td class="table-dark">
           <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
           </td>
             </tr>
        </table>
</asp:Content>
