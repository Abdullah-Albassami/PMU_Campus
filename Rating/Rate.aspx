<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rate.aspx.cs" Inherits="PMU_Campus.Rating.Rate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <th>
                    <asp:Label ID="SelectCourse" runat="server" Text="Select a Course"></asp:Label>
                </th>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </td>
            </tr>
       </table>
    </form>
</body>
</html>
