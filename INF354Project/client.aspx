<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="INF354Project.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Register Client</h1> <!-- for adding client -->

                <asp:SqlDataSource ID="addclient" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblClient]" DeleteCommand="DELETE FROM [tblClient] WHERE [id] = @id" InsertCommand="INSERT INTO [tblClient] ([Name], [Lastname], [email], [titleID]) VALUES (@Name, @Lastname, @email, @titleID)" UpdateCommand="UPDATE [tblClient] SET [Name] = @Name, [Lastname] = @Lastname, [email] = @email, [titleID] = @titleID WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Lastname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="titleID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Lastname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="titleID" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <asp:GridView ID="Client" EmptyDataText="No records have been added." runat="server" AutoGenerateColumns="False" DataSourceID="addclient" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />

                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="titleID" HeaderText="titleID" SortExpression="titleID" />
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
    <asp:Panel ID="Panel2" runat="server" GroupingText="Add Client" Height="232px" Width="305px">
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        Lastname:
        <asp:TextBox ID="txtLastname" runat="server" Width="120px"></asp:TextBox>
        <br />
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddTitle" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="id">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Regiser" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblTitle]"></asp:SqlDataSource>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="Update" Height="186px" Width="303px">
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNameEd" runat="server"></asp:TextBox>
        <br />
        Lastname:
        <asp:TextBox ID="txtLnEd" runat="server"></asp:TextBox>
        <br />
        old Email:&nbsp;
        <asp:TextBox ID="txtOldEmail" runat="server"></asp:TextBox>
        <br />
        new Emal:
        <asp:TextBox ID="txtEmailEd" runat="server"></asp:TextBox>
        <br />
        Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddTitleEd" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="id">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
        <br />
    </asp:Panel>
    <br />
&nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
    :<br />
    &nbsp;&nbsp;&nbsp;
&nbsp;<br />
    <br />
    <br />

</asp:Content>
