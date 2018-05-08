<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Furniture.aspx.cs" Inherits="INF354Project.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add Furniture</h1>
    <!-- for adding client -->

                <asp:SqlDataSource ID="sdsFurniture" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblFurniture]"></asp:SqlDataSource>
    <asp:GridView ID="Furniture" EmptyDataText="No records have been added." runat="server" AutoGenerateColumns="False" DataSourceID="sdsFurniture" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="typeID" HeaderText="typeID" SortExpression="typeID" />
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
    <br />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Delete" Height="122px" Width="281px">
        <asp:Label ID="lable" runat="server" Text="ID"></asp:Label>
        <asp:TextBox ID="txtId" runat="server" OnTextChanged="txtId_TextChanged"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="Add Furniture" Height="232px" Width="305px">
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddType" runat="server" DataSourceID="SqlDataSource1" DataTextField="Type" DataValueField="id">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnRegister_Click" Text="Add" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" DeleteCommand="DELETE FROM [tblFurnitureType] WHERE [id] = @id" InsertCommand="INSERT INTO [tblFurnitureType] ([Type]) VALUES (@Type)" SelectCommand="SELECT * FROM [tblFurnitureType]" UpdateCommand="UPDATE [tblFurnitureType] SET [Type] = @Type WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="Update" Height="170px" Width="299px">
        ID to update:&nbsp;&nbsp;
        <asp:TextBox ID="txtIDEd" runat="server"></asp:TextBox>
        <br />
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNameEd" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddTypeEd" runat="server" DataSourceID="SqlDataSource1" DataTextField="Type" DataValueField="id">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
        <br />
    </asp:Panel>
    <br />
&nbsp;&nbsp;
    <br />
    <asp:Panel ID="Panel4" runat="server" GroupingText="Search" Height="107px" Width="299px">
        Name to search:&nbsp;&nbsp;
        <asp:TextBox ID="txtNameSearch" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Button" />
        &nbsp;
        <asp:Button ID="btnRevert" runat="server" OnClick="btnEdit_Click" Text="Revert" />
        <br />
    </asp:Panel>
    <br />
    <asp:DataList ID="DataList1" runat="server">
    </asp:DataList>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    </asp:GridView>
    <br />
    <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
    :<br />&nbsp;&nbsp;&nbsp;
&nbsp;<br />
    <br />
    <br />
</asp:Content>
