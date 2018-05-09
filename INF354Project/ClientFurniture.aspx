<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientFurniture.aspx.cs" Inherits="INF354Project.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Add Client Furniture</h1>
    <!-- for adding client -->

                <asp:SqlDataSource ID="sdsClFur" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblClientFurniture]"></asp:SqlDataSource>
    <asp:GridView ID="ClFur" EmptyDataText="No records have been added." runat="server" AutoGenerateColumns="False" DataSourceID="sdsFurniture" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Delete" Height="122px" Width="281px">
        <asp:Label ID="lable" runat="server" Text="Client ID"></asp:Label>
        <asp:TextBox ID="txtCId" runat="server" OnTextChanged="txtId_TextChanged"></asp:TextBox>
        <br />
        <asp:Label ID="lable0" runat="server" Text="Furniture ID"></asp:Label>
        <asp:TextBox ID="txtfId" runat="server" OnTextChanged="txtId_TextChanged"></asp:TextBox>
        <br />
        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="Add Client Furniture" Height="168px" Width="305px">
        Client Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddCName" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        Furniture name:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddFName" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnRegister_Click" Text="Add" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [tblClient]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [tblFurniture]"></asp:SqlDataSource>
        <br />
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="Update" Height="205px" Width="299px">
        Client id to update:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddCIDEd" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        Furniture&nbsp; id to update:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddFIDEd" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        Client id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddCINew" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        Furniture id :&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddFidNew" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="id">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
    </asp:Panel>
    <br />
    <br />
&nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
    :<br />&nbsp;&nbsp;&nbsp;
&nbsp;<br />
    <br />
    <br />

</asp:Content>
