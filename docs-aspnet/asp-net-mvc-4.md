---
title: Use with ASP.NET MVC 4
page_title: Use with ASP.NET MVC 4
description: "Use Progress Telerik UI for ASP.NET MVC in ASP.NET MVC 4 applications."
previous_url: /aspnetmvc-apps/asp-net-mvc-4
slug: aspnetmvc4_aspnetmvc
position: 13
---

# Use with ASP.NET MVC 4

This article demonstrates how to use Progress Telerik UI for ASP.NET MVC in ASP.NET MVC 4 applications. It uses Visual Studio 2012 but the examples are applicable to all Visual Studio versions that support ASP.NET MVC 4. The examples create a new ASP.NET MVC 4 application but the steps to use Telerik UI for ASP.NET MVC in existing ASP.NET MVC 4 applications are the same.

> The [Progress Telerik UI for ASP.NET MVC Visual Studio extensions]({% slug overview_visualstudio_aspnetcore %}) automate the whole procedure which this document describes.

## Create New ASP.NET MVC 4 Applications

Below are listed the steps for you to follow when creating a new ASP.NET MVC 4 application.

**Step 1** Open Visual Studio 2012.

**Step 2** Press `CTRL+SHIFT+N` to create a new project.

**Step 3** Select the **Visual C#** > **Web** to show all available web project templates for C#.

**Step 4** Select **ASP.NET MVC 4 Web Application** > **OK**. This starts the **New ASP.NET MVC 4 Project** wizard.

**Step 5** Select **Internet Application** from the available templates and click **OK**. Alternatively, you can select other templates&mdash;the remaining steps are the same.

**Step 6** Press `CTRL+F5` to build and run the application.

![The new ASP.NET MVC 4 application](images/mvc4-new-app.png)

## Add Progress Telerik UI for ASP.NET MVC

To use Progress Telerik UI for ASP.NET MVC, include the required JavaScript and CSS files, reference the `Kendo.Mvc.dll` assembly and update the `web.config` file of the application.

### Include JavaScript and CSS Files

Progress Telerik UI for ASP.NET MVC requires certain JavaScript and CSS files to be included in the page.

There are two options:
* Either include a local copy of those files
* Or use the Kendo UI CDN (Content Delivery Network) services

#### Use Local JavaScript and CSS

Below are listed the steps for you to follow when copying the required JavaScript and CSS files in the Visual Studio Solution of the application.

**Step 1** Navigate to the install location of Telerik UI for ASP.NET MVC. By default, it is in `C:\Program Files (x86)\Progress\`. For versions prior to R3 2017, the default install location is in `C:\Program Files (x86)\Telerik\`.

**Step 2** Copy the `js` directory from the install location and paste it in the `Scripts` folder of the application.

**Step 3** Copy the `styles` directory from the install location and paste it in the `Content` folder of the application.

**Step 4** Rename the `Scripts/js` directory to `Scripts/kendo`. Rename `Content/styles` to `Content/kendo`.

**Figure 2. Kendo UI directories in the Solution Explorer**

![Kendo directories in the Solution Explorer](images/mvc4-solution.png)

After the needed JavaScript and CSS files are added to the application, you can include them.

**Step 5** Open `App_Start/BundleConfig.cs` to add bundles for Progress Telerik UI for ASP.NET MVC.

**Step 6** Add a script bundle for Progress Telerik UI for ASP.NET MVC.

    bundles.Add(new ScriptBundle("~/bundles/kendo").Include(
                "~/Scripts/kendo/kendo.all.min.js",
                // "~/Scripts/kendo/kendo.timezones.min.js", // uncomment if using the Scheduler
                "~/Scripts/kendo/kendo.aspnetmvc.min.js"));

**Step 7** Add a style bundle for Progress Telerik UI for ASP.NET MVC.

> Make sure you are familiar with the article on the Progress Telerik UI for ASP.NET MVC [fundamentals and CSS bundling]({% slug fundamentals_aspnetmvc %}#css-bundling).

    bundles.Add(new StyleBundle("~/Content/kendo/css").Include(
                "~/Content/kendo/kendo.common.min.css",
                "~/Content/kendo/kendo.default.min.css"));

**Step 8** Tell the ASP.NET bundles to allow minified files in debug mode.

    bundles.IgnoreList.Clear();

**Step 9** Open the layout of the application. By default, it is `Views/Shared/_Layout.cshtml`, or `Site.master` if using ASPX.

**Step 10** Render the Progress Telerik UI for ASP.NET MVC style bundle.

```ASPX
    <%: Styles.Render("~/Content/kendo/css") %>
```
```Razor
    @Styles.Render("~/Content/kendo/css")
```

**Step 11** Move the jQuery bundle to the `head` tag of the page. It is at the end of the page by default.

**Step 12** Render the Progress Telerik UI for ASP.NET MVC script bundle after jQuery.

```ASPX
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/kendo") %>
```
```Razor
    @Scripts.Render("~/bundles/jquery")
    @Scripts.Render("~/bundles/kendo")
```

#### Use CDN Services

Below are listed the steps for you to follow when including the Progress Telerik UI for ASP.NET MVC JavaScript and CSS files from CDN.

> Make sure you replace the `kendo ui version` from the code snippets below with the current version of the product&mdash;for example, `2013.2.918`.

**Step 1** Open the layout of the application. By default, it is `Views/Shared/_Layout.cshtml`, or `Site.master` if using ASPX.

**Step 2** Include `kendo.common.min.css` and `kendo.default.min.css`. Add a `link` tag within the `head` tag of the layout.

    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/<kendo ui version>/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/<kendo ui version>/styles/kendo.default.min.css" />

**Step 3** Move the jQuery bundle to the `head` tag of the page. By default, it is at the end of the page.

**Step 4** Include `kendo.all.min.js` and `kendo.aspnetmvc.min.js` after jQuery.

    <script src="https://kendo.cdn.telerik.com/<kendo ui version>/js/kendo.all.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/<kendo ui version>/js/kendo.aspnetmvc.min.js"></script>

**Step 5** If using the Telerik MVC Scheduler wrapper, include `kendo.timezones.min.js` after `kendo.all.min.js`.

    <script src="https://kendo.cdn.telerik.com/<kendo ui version>/js/kendo.all.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/<kendo ui version>/js/kendo.timezones.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/<kendo ui version>/js/kendo.aspnetmvc.min.js"></script>

### Add Kendo.Mvc.dll Reference

The next step is to add a reference to `Kendo.Mvc.dll` which is the assembly containing the Kendo UI MVC server-side wrappers.

**Step 1** Right-click the **References** node in Solution Explorer. Click **Add Reference**.

**Step 2** Select the **Browse** tab of the **Add Reference** dialog. Navigate to the install location of Progress Telerik UI for ASP.NET MVC.

**Step 3** Navigate to `wrappers/aspnetmvc/Binaries/MVC4`. This directory contains the ASP.NET MVC 4 version of Progress Telerik UI for ASP.NET MVC.

**Step 4** Select `Kendo.Mvc.dll`. Click **OK**.

### Update web.config

The next step is to let ASP.NET MVC know of the `Kendo.Mvc.UI` namespace where the server-side wrappers are. To do this, update the `web.config` file of the web application.

**Step 1** Open `Views/Web.config`, or root `Web.config` if using ASPX.

**Step 2** Locate the `namespaces` tag.

**Step 3** Append an `add` tag to the `namespaces` tag.

    <namespaces>
        <add namespace="System.Web.Mvc" />
        <add namespace="System.Web.Mvc.Ajax" />
        <add namespace="System.Web.Mvc.Html" />
        <add namespace="System.Web.Routing" />
        <add namespace="Kendo.Mvc.UI" />
    </namespaces>

## Use Kendo UI Widgets

Below are listed the steps for you to follow when using a Kendo UI widget through its MVC server-side wrapper initialization.

**Step 1** Open the `Views/Home/Index.cshtml` view, or `Index.aspx` if using ASPX.

**Step 2** Add a Kendo UI DatePicker widget.

```ASPX
    <%: Html.Kendo().DatePicker().Name("datepicker") %>
```
```Razor
    @(Html.Kendo().DatePicker().Name("datepicker"))
```

**Step 3** Press `CTRL+F5` to build and run the application.

![The final result](images/mvc4-final.png)

## Next Steps

* [Progress Telerik UI for ASP.NET MVC Fundamentals]({% slug fundamentals_aspnetmvc %})
* [Use the Progress Telerik UI for ASP.NET MVC Visual Studio Extensions]({% slug overview_visualstudio_aspnetcore %})
* [Progress Telerik UI for ASP.NET MVC Troubleshooting]({% slug troubleshooting_aspnetmvc %})

## See Also

* [Progress Telerik UI for ASP.NET MVC Overview]({% slug overview_aspnetmvc6_aspnetmvc %})
* [Progress Telerik UI for ASP.NET MVC HtmlHelpers]({% slug knownissues_aspnetmvc6_aspnetmvc %})
* [Tutorials on Progress Telerik UI for ASP.NET MVC]({% slug overview_timeefficiencyapp_aspnetmvc6 %})
* [Progress Telerik UI for ASP.NET MVC Fundamentals]({% slug fundamentals_aspnetmvc %})
* [Scaffolding with Progress Telerik UI for ASP.NET MVC]({% slug scaffolding_aspnetcore %})
* [Progress Telerik UI for ASP.NET MVC Troubleshooting]({% slug troubleshooting_aspnetmvc %})
