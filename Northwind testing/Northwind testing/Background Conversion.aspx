<%@ Page Title="Conversion" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" EnableEventValidation="false" 
CodeBehind="Background Conversion.aspx.cs" Inherits="Northwind_testing.Background_Conversion" %>

<asp:Content ID="Converts" runat="server" ContentPlaceHolderID = "MainContent">
<div>
    <h1>
        Conversion to C# testing area
    </h1>
    <h2>
        Please select a city
    </h2>
        <asp:DropDownList ID="CityFilter" runat="server" AutoPostBack="true"></asp:DropDownList>
        <br />
        <h2>
            Filter by gender
        </h2>
        <asp:DropDownList ID="TitleFilter" runat="server" AutoPostBack="True" 
            DataSourceID="GetTitles" DataTextField="Title" DataValueField="Title" >
        </asp:DropDownList>
        <br />
        <br />
        <table style="width:100%">
            <tr>
                <td style="width:50%">
                    <asp:GridView ID="FilteredGrid" runat="server" 
                        OnRowDataBound="FilteredGrid_RowDataBound" DataKeyNames="EmployeeId" 
                        AutoGenerateColumns="True" DataSourceID="GetDynamicEmps" >
                    <HeaderStyle BackColor="Cornsilk" />
                    <RowStyle BackColor="PaleTurquoise" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="Turquoise" />
                    </asp:GridView> 
                </td>
                <td style="width:50%">   
                    <asp:DetailsView ID="EmployeeDetails" runat="server" OnRowDataBound="EmployeeDetails_OnDataBound" 
                    OnItemInserted="EmployeeDetails_OnItemInserted" OnItemUpdated="EmployeeDetails_OnItemUpdated" AutoGenerateRows="False" 
                    AutoGenerateEditButton="True" AutoGenerateInsertButton="True" DataKeyNames="EmployeeID" 
                    DataSourceID="GetEmpDetails" onpageindexchanging="EmployeeDetails_PageIndexChanging">
                    <CommandRowStyle BackColor="Cornsilk" />
                    <RowStyle BackColor="PaleTurquoise" />
                    <AlternatingRowStyle BackColor="Turquoise" />
                        <Fields>
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                                SortExpression="LastName" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                                SortExpression="FirstName" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("TitleOfCourtesy") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="iTitleDropDown" runat="server" DataSourceID="GetTitles" AutoPostBack="true" DataTextField="Title" DataValueField="Title"></asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                     <asp:DropDownList ID="eTitleDropDown" runat="server" DataSourceID="GetTitles" AutoPostBack="true" DataTextField="Title" DataValueField="Title"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                                SortExpression="BirthDate" />
                            <asp:BoundField DataField="HireDate" HeaderText="HireDate"  
                                SortExpression="HireDate" />
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" 
                                SortExpression="City" />
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
                            <asp:BoundField DataField="Notes" HeaderText="Notes" 
                                SortExpression="Notes" />
                            <asp:BoundField DataField="ReportsTo" HeaderText="ReportsTo" 
                                SortExpression="ReportsTo" />
                            <asp:BoundField DataField="Age" HeaderText="Age" 
                                SortExpression="Age" />
                            <asp:BoundField DataField="Children" HeaderText="Children"
                                SortExpression="Children" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary"
                                SortExpression="Salary" />
                                <asp:BoundField DataField="Bonuses" HeaderText="Bonuses"
                                SortExpression="Bonuses" />
                                <asp:BoundField DataField="Department" HeaderText="Department"
                                SortExpression="Department" />
                        </Fields>
                    </asp:DetailsView> 
                </td>
            </tr>
        </table>
    </div>
<asp:SqlDataSource ID="GetTitles" runat="server" 
    ConnectionString="<%$ ConnectionStrings:North %>" SelectCommand="GetTitles" 
    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="GetDynamicEmps" runat="server" 
    ConnectionString="<%$ ConnectionStrings:North %>" 
    SelectCommand="DynamicEmployeeList" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="CityFilter" DefaultValue="London" Name="City" 
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="TitleFilter" DefaultValue="Mr." Name="Title" 
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="GetEmpDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:North %>" 
        SelectCommand="GetDetails" SelectCommandType="StoredProcedure" 
        InsertCommand="InsertEmployee" InsertCommandType="StoredProcedure"
        UpdateCommand="UpdateEmployee" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:ControlParameter Name="TitleOfCourtesy" ControlID="EmployeeDetails$iTitleDropDown" Type="String" Direction="Input" />
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
            <asp:Parameter Name="ReportsTo" Type="String" />
            <asp:Parameter Name="Age" Type="String" />
            <asp:Parameter Name="Children" Type="String" />
            <asp:Parameter Name="Salary" Type="String" />
            <asp:Parameter Name="Bonuses" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:ControlParameter Name="TitleOfCourtesy" ControlID="EmployeeDetails$eTitleDropDown" Type="String" Direction="Input"/>
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
            <asp:Parameter Name="ReportsTo" Type="String" />
            <asp:Parameter Name="Age" Type="String" />
            <asp:Parameter Name="Children" Type="String" />
            <asp:Parameter Name="Salary" Type="String" />
            <asp:Parameter Name="Bonuses" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="FilteredGrid" Name="EmployeeID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

