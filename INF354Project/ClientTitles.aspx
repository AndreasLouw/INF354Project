<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientTitles.aspx.cs" Inherits="INF354Project.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Client Titles</h1>
        <asp:SqlDataSource ID="SDSTitle" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblTitle]" DeleteCommand="DELETE FROM [tblTitle] WHERE [id] = @id" InsertCommand="INSERT INTO [tblTitle] ([Title]) VALUES (@Title)" UpdateCommand="UPDATE [tblTitle] SET [Title] = @Title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                <br />
        <asp:GridView ID="GridTitle" EmptyDataText="No records have been added." runat="server" AutoGenerateColumns="False" DataSourceID="SDSTitle" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
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
    <asp:Panel ID="Panel1" runat="server" GroupingText="Delete" Height="122px" Width="281px">
        <asp:Label ID="lable" runat="server" Text="ID"></asp:Label>
        <asp:TextBox ID="txtId" runat="server" OnTextChanged="txtId_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="Add Title" Height="114px" Width="305px">
        Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
&nbsp;<br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnRegister_Click" Text="Add" />
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="Update" Height="110px" Width="299px">
        ID to update:&nbsp;&nbsp;
        <asp:TextBox ID="txtIDEd" runat="server"></asp:TextBox>
        <br />
        Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitleEd" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
        <br />
    </asp:Panel>
    <br />
                <br />
        <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
    <br />
    <br />


</asp:Content>
