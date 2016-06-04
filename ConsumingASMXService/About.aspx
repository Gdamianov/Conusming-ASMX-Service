<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ConsumingASMXService.About" %>
<%@ Register Src="~/SecondControl.ascx" TagName="SecondControl" TagPrefix="second" %>
<%@ Register Src="~/MainControl.ascx"  TagName="MainControl" TagPrefix="main" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <div>
        <second:SecondControl runat="server"/>
        <main:MainControl  runat="server"/>
    </div>
    <div class="btn btn-primary" id="openMain">main</div>
    <div class="btn btn-primary" id="openSecond">second</div>
    <script>    
        $("#openMain").click(function () { $("#main").css("display", "block") });
        $("#openSecond").click(function () { $("#second").css("display", "block") });
        $("#exitMain").click(function () { $("#main").css("display", "none") });
        $("#exitSecond").click(function () { $("#second").css("display", "none") });

        $("#clickMain").click(function () {
            var text = $("#numberMain").val();
            var obj = { name: text };
            $.ajax({
                url: "Service.asmx/HelloWorld",
                type: "POST",
                data: JSON.stringify(obj),
                contentType: "application/json",
                dataType: "json"

            }).then(function (data) { alert(data.d) });
        });

        $("#clickSecond").click(function () {
            var text = $("#number").val();
            $("#numberMain").val(text);
            $("#exitSecond").trigger("click");
            $("#clickMain").trigger("click");
        })
    </script>
</asp:Content>
