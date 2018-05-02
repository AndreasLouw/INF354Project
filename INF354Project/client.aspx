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
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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

                <asp:FormView ID="clientReg" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="addclient" DefaultMode="Insert" ForeColor="#333333" OnPageIndexChanging="clientReg_PageIndexChanging">
                    <EditItemTemplate>
                        id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Lastname:
                        <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        titleID:
                        <asp:TextBox ID="titleIDTextBox" runat="server" Text='<%# Bind("titleID") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>

                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

                    <InsertItemTemplate>
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Lastname:
                        <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        titleID:
                        <asp:TextBox ID="titleIDTextBox" runat="server" Text='<%# Bind("titleID") %>' />
                        <br />

                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>

                    <ItemTemplate>
                        id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Lastname:
                        <asp:Label ID="LastnameLabel" runat="server" Text='<%# Bind("Lastname") %>' />
                        <br />
                        email: <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        titleID:
                        <asp:Label ID="titleIDLabel" runat="server" Text='<%# Bind("titleID") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>


                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:FormView>

    <br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="err"></asp:Label>
    <br />
    <br />
    Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br />
    Lastname:&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
    <br />
    email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddTitle" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="id">
    </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INF354ConnectionString %>" SelectCommand="SELECT * FROM [tblTitle]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Regiser" />
    <br />
    <br />

</asp:Content>
