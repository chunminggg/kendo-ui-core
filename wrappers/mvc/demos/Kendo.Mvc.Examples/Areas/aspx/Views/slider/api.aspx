<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="box wide">
    <div class="box-col">
        <h4>Slider API Functions</h4>
        <ul class="options">
            <li>
                <button class="k-button" id="enableSlider">Enable</button>
                <button class="k-button" id="disableSlider">Disable</button>
            </li>
            <li>
                <input type="text" id="newValue" value="1" class="k-textbox" />
                <button class="k-button" id="setSliderValue">Set value</button>
            </li>
            <li>
                <button class="k-button" id="getSliderValue">Get value</button>
            </li>
        </ul>
    </div>
    <div class="box-col">
        <h4>RangeSlider API Functions</h4>
        <ul class="options">
            <li>
                <button class="k-button" id="enableRangeSlider">Enable</button>
                <button class="k-button" id="disableRangeSlider">Disable</button>
            </li>
            <li>
                <input type="text" id="startValue" value="1" class="k-textbox" />
                <button class="k-button" id="setStartValue">Set selection start</button> &nbsp; | &nbsp;
                <input type="text" id="endValue" value="1" class="k-textbox" />
                <button class="k-button" id="setEndValue">Set selection end</button>
            </li>
            <li>
                <button class="k-button" id="getRangeSliderValue">Get value</button>
            </li>
        </ul>
    </div>
</div>

<div class="demo-section k-content">
    <ul id="fieldlist">
        <li>
            <label>Temperature</label>
<%= Html.Kendo().Slider()
        .Name("slider")
        .HtmlAttributes(new { @class = "temperature" })
%>
        </li>
        <li>
            <label>Humidity</label>
<%= Html.Kendo().RangeSlider()
        .Name("rangeslider")
        .HtmlAttributes(new { @class = "humidity" })
%>
        </li>
    </ul>
</div>

<script>
    $(document).ready(function () {
        var slider = $("#slider").data("kendoSlider"),
            rangeSlider = $("#rangeslider").data("kendoRangeSlider"),
            setValue = function (e) {
                if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                    var value = parseInt($("#newValue").val(), 10);

                    if (isNaN(value) || value < 0 || value > 10) {
                        alert("Value must be a number between 0 and 10");
                        return;
                    }

                    slider.value(value);
                }
            },
            setStartValue = function (e) {
                if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                    var startValue = parseInt($("#startValue").val(), 10);

                    if (isNaN(startValue) || startValue < 0 || startValue > 10) {
                        alert("Value must be a number between 0 and 10");
                        return;
                    }

                    var endValue = getValue()[1];
                    rangeSlider.value([startValue, endValue]);
                }
            },
            setEndValue = function (e) {
                if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                    var startValue = getValue()[0];
                    var endValue = parseInt($("#endValue").val(), 10);

                    if (isNaN(endValue) || endValue < 0 || endValue > 10) {
                        alert("Value must be a number between 0 and 10");
                        return;
                    }

                    rangeSlider.values(startValue, endValue);
                }
            };

        $("#getSliderValue").click(function () {
            alert(slider.value());
        });

        $("#enableSlider").click(function () {
            slider.enable();
        });

        $("#disableSlider").click(function () {
            slider.disable();
        });

        function getValue() {
            return rangeSlider.value();
        }

        $("#setSliderValue").click(setValue);
        $("#newValue").keypress(setValue);

        $("#setStartValue").click(setStartValue);
        $("#startValue").keypress(setStartValue);

        $("#setEndValue").click(setEndValue);
        $("#endValue").keypress(setEndValue);

        $("#getRangeSliderValue").click(function () {
            alert(getValue());
        });

        $("#enableRangeSlider").click(function () {
            rangeSlider.enable();
        });

        $("#disableRangeSlider").click(function () {
            rangeSlider.disable();
        });
    });
</script>

<style>
   .options .k-textbox {
       width: 40px;
       margin-left: 0;

   }
   .k-button {
       min-width: 80px;
   }

   #fieldlist {
       margin: 0 0 -2em;
       padding: 0;
       text-align: center;
   }

   #fieldlist > li {
       list-style: none;
       padding-bottom: 2em;
   }

   #fieldlist label {
       display: block;
       padding-bottom: 1em;
       font-weight: bold;
       text-transform: uppercase;
       font-size: 12px;
       color: #444;
   }
</style>
</asp:Content>