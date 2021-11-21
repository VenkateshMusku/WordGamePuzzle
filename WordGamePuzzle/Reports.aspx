<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="WordGamePuzzle.Reports" %>

<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-dark table-hover">
        <tbody style="margin-left: 80px">
            <tr>
                <td class="table-dark">Congratulations!
            You have completed the game. Please refer to the below report to see how frequently words are used for a specific race and gender.
                </td>
            </tr>
            <tr>
                <td class="table-dark">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Race" HeaderText="Race" SortExpression="Race" />
                            <asp:BoundField DataField="Word" HeaderText="Word" SortExpression="Word" />
                            <asp:BoundField DataField="FrequencyUsed" HeaderText="Frequency Used" ReadOnly="True" SortExpression="FrequencyUsed" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle BorderWidth="1px" ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlayBookConnectionString %>" SelectCommand="usp_getReport" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
    </table>
</asp:Content>
