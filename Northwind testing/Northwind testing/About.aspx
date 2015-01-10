<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="Northwind_testing.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Grid with master-details for inserting records
    </h2>
    <br/>
    <h3>
        Please select a city
    </h3>


    <asp:DropDownList ID="DropDownList1" DataSourceID="SqlSource2" AutoPostBack="true"
        DataTextField="City" runat="server" />
    <asp:SqlDataSource ID="SqlSource2" runat="server" 
        SelectCommand="SELECT DISTINCT [City] FROM [Employees]"
        ConnectionString="<%$ connectionStrings:North %>"
        />
    <br />
    <br />
    <table>
        <tr>
            <td valign="top">
                <asp:GridView ID="GridView1" AllowSorting="true" AllowPaging="true" runat="server" DataSourceID="SqlSource1" DataKeyNames="EmployeeID" AutoGenerateColumns="false" Width="500px" SelectedIndex="0" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanged="GridView1_PageIndexChanged" OnRowDeleted="GridView1_RowDeleted" OnSorted="GridView1_Sorted">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" ShowDeleteButton="true" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="ID" ReadOnly="true" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlSource1" runat="server" ConnectionString="<%$ connectionStrings:North%>"
                SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [City] FROM [Employees] WHERE [City] = @City"
                UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title WHERE [EmployeeID] = @EmployeeID" 
                DeleteCommand="DELTE FROM [Employees] WHERE [EmployeeID]=@EmployeeID">                
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="City" PropertyName="SelectedValue" Type="String"/>
                </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:DetailsView AutoGenerateRows="False" runat="server" DataKeyNames="EmployeeId" DataSourceID="SqlSource3" 
                    HeaderText="Employee Details" ID="DetailsView1"  OnItemUpdated="DetailsView1_ItemUpdated" OnItemInserted="DetailsView1_ItemInserted" OnDataBound="DetailsView1_DataBound">
                <Fields>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="TitleOfCourtesy" HeaderText="Title of Courtesy" SortExpression="TitleOfCourtesy" />
                    <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" />
                    <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                    <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" SortExpression="HomePhone" />
                    <asp:BoundField DataField="Extension" HeaderText="Extension" SortExpression="Extension" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:BoundField DataField="ReportsTo" HeaderText="Reports To" SortExpression="ReportsTo" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" />
                </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlSource3" runat="server" ConnectionString="<%$ connectionStrings:North%>"
                SelectCommand="SELECT * FROM [Employees] WHERE [EmployeeID] = @EmployeeID"
               
                UpdateCommand="UPDATE [Employees] SET [LastName]=@LastName,[FirstName]=@FirstName,[Title]=@Title,[TitleOfCourtesy]=@TitleOfCourtesy,[BirthDate]=@BirthDate,[HireDate]=@HireDate,
                [Address]=@Address,[City]=@City,[Region]=@Region,[PostalCode]=@PostalCode,[Country]=@Country,[HomePhone]=@HomePhone,[Extension]=@Extension,[Notes]=@Notes,[ReportsTo]=@ReportsTo WHERE [EmployeeID] = @EmployeeID"
               
                InsertCommand="INSERT INTO [Employees] ([LastName],[FirstName],[Title],[TitleOfCourtesy],[Address],[City],[Region],[PostalCode],[Country],[HomePhone],[Extension])
                VALUES (@LastName,@FirstName,@Title,@TitleOfCourtesy,@Address,@City,@Region,@PostalCode,@Country,@HomePhone,@Extension)">

               
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="EmployeeID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmployeeID" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Region" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="Extension" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ReportsTo" Type="Int16" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Region" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="Extension" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ReportsTo" Type="Int16" />
                </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>    
    </table>  
    <asp:Label ID="ErrorMessageLabel" EnableViewState="false" runat="server" />
</asp:Content>
