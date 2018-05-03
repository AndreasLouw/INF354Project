<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FurnitureType.aspx.cs" Inherits="INF354Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Furniture Types</h1>
        <asp:GridView ID="Type" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SDSType" EmptyDataText="No records have been added." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
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

        <asp:SqlDataSource ID="SDSType" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" DeleteCommand="DELETE FROM [tblFurnitureType] WHERE [id] = @id" InsertCommand="INSERT INTO [tblFurnitureType] ([Type]) VALUES (@Type)" SelectCommand="SELECT * FROM [tblFurnitureType]" UpdateCommand="UPDATE [tblFurnitureType] SET [Type] = @Type WHERE [id] = @id">
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
    <asp:Panel ID="Panel2" runat="server" GroupingText="Add Type" Height="114px" Width="305px">
        Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
&nbsp;<br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnRegister_Click" Text="Add" />
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="Update" Height="110px" Width="299px">
        ID to update:&nbsp;&nbsp;
        <asp:TextBox ID="txtIDEd" runat="server"></asp:TextBox>
        <br />
        Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTypeEd" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
        <br />
    </asp:Panel>
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
</asp:Content>
