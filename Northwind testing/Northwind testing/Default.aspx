<%@ Page Title="Grid Tests" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Northwind_testing._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to My testing page!
    </h2>
    <br/>
    <h3>
        Please select a city
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="City">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:North %>" 
            SelectCommand="SELECT DISTINCT [City] FROM [Employees]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="TitleOfCourtesy" 
                    SortExpression="TitleOfCourtesy" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                    SortExpression="BirthDate" />
                <asp:BoundField DataField="HireDate" HeaderText="HireDate" 
                    SortExpression="HireDate" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Region" HeaderText="Region" 
                    SortExpression="Region" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                    SortExpression="PostalCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" 
                    SortExpression="HomePhone" />
                <asp:BoundField DataField="Extension" HeaderText="Extension" 
                    SortExpression="Extension" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="ReportsTo" HeaderText="ReportsTo" 
                    SortExpression="ReportsTo" />
                <asp:BoundField DataField="PhotoPath" HeaderText="PhotoPath" 
                    SortExpression="PhotoPath" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:North %>" 
            SelectCommand="SELECT * FROM [Employees] WHERE ([City] = @City)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="City" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </h3>
    
        

</asp:Content>
