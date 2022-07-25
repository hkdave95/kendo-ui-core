---
title: Using Script License Code
page_title: Using Script License Code | Download and Installation 
description: "Get started with Kendo UI for jQuery and learn how to download the library and initialize its widgets."
slug: using-license-code
position: 5
---

# Setting Up the License Key

Kendo UI for jQuery is a UI library distributed under a commercial license. 

As of the R2 2022 release, using any of the Kendo UI for jQuery components from the NPM distribution channel requires a script license registration. Depending on the license type that you own, you can register an active trial license or a commercial license key.

If you are experiencing any issues related to the license key, inform the team through the [available support channels]({% slug welcometo_kendoui %}#support-options).

>* The script license registration is required only for the commercial NPM package (`@progress/kendo-ui`). The other Kendo UI for jQuery commercial distributions or script sources require only an active license, that is, you don't need script registration when using NuGet, CDN, Bower, and locally downloaded Kendo UI bundles. 
>* The license key will be distributed along with the scripts and this cannot not be avoided. However, Progress recommends that you do not publicly announce it.

## 1. Get a License Key

To acquire a license key, generate it: 

<link rel="stylesheet" href="https://d3fu8oi3wk1rz4.cloudfront.net/kendo-docs-demos-assets/0.0.1/styles/license-key/styles.css" />
<script src="https://d3fu8oi3wk1rz4.cloudfront.net/kendo-docs-demos-assets/0.0.1/scripts/license-key/index.js"></script>

<license-download-link
    product-codes="KENDOUICOMPLETE, KENDOUI, KENDOUIMVC, UIASPCORE"
    product-name="Kendo UI for jQuery";
    purchase-url="https://www.telerik.com/purchase/kendo-ui"
    trial-url="https://www.telerik.com/try/kendo-ui"
    download-code-url="https://docs.telerik.com/kendo-ui/my-license/download">
</license-download-link>

## 2. Register the License Key

To register your license key, set it up by using either of the following approaches: 

* [Use the NPM package](#use-the-npm-package)
* [Use a script reference](#use-a-script-reference)

Then, utilize the `KendoLicensing.setScriptKey()` method.

### Use the NPM Package

Use the [previously generated code](#1-get-a-license-key) and place it in the main script file the where Kendo UI for jQuery scripts are imported.

```js
import "@progress/kendo-ui";

KendoLicensing.setScriptKey(
    'Your license code'
);

$("#grid").kendoGrid();
```

or

```js
require("@progress/kendo-ui");

KendoLicensing.setScriptKey(
    'Your license code'
);

$("#grid").kendoGrid();
```

The examples above illustrates a single include of `kendo.all.js` in your main javascript file that could be located in one of the [common places](#common-places-to-setup-the-license-code).

In most cases you would need several imports of the Kendo libraries and you would need to setup the license code only on one place (most likely your main js file in your application). In that case, import the `kendo.core.js` and register your license code as usual: 

```js
import '@progress/kendo-ui/js/kendo.core';

KendoLicensing.setScriptKey(
    'Your license code'
);

// Rest of the code
```

or 

```js
require("@progress/kendo-ui/js/kendo.core");

KendoLicensing.setScriptKey(
    'Your license code'
);

// Rest of the code
```

### Using Script Reference

Use the [previously generated code](#1-get-a-license-key) and place it right after the script tag.

```html
<script src="***/kendo.all.min.js"></script>

<script>
    KendoLicensing.setScriptKey(
        'Your license code'
    );
</script>
```

### Common Places to Setup the License Code

Most common files to place the license code in your application are: 

**For JS Applications:**
- `./index.(html|js|ts)`
- `./main.(html|js|ts)`
- `./app.(html|js|ts)`
- `./(dist|src)/index.(html|js|ts)`
- `./(dist|src)/main.(html|js|ts)`
- `./(dist|src)/app.(html|js|ts)`

**For ASP.NET MVC Applications:**
- `./Views/Shared/_Layout.cshtml`
- `./Scripts/index.(js|ts)`
- `./Scripts/site.(js|ts)`

**For ASP.NET Core Applications:**
- `./Views/Shared/_Layout.cshtml`
- `./Pages/Shared/_Layout.cshtml`
- `./Pages/_Layout.cshtml`
- `./wwwroot/js/index.js`
- `./wwwroot/js/site.js`

## Next Steps

* [Create Your Own Custom Bundles]({% slug include_only_what_you_need_kendoui_scripts %})
* [Create Your Own Custom Widgets]({% slug createcustomkendouiwidgets_gettingstarted %})
* [Initialize Widgets as jQuery Plugins]({% slug initialize_widgets_using_jquery_plugins_installation %})
* [Initialize Widgets with MVVM]({% slug mvvm_initialization_kendoui %})
* [Widget Script Dependencies]({% slug script_filesfor_barcodes_widgets %})

## See Also

* [Hosting Kendo UI in Your Project]({% slug hosting_kendoui %})
* [Installing Kendo UI with Bower]({% slug kendoui_bower_packages_kendoui_installation %})
* [Obtaining Kendo UI by Using the CDN Services]({% slug kendoui_cdn_services_installation %})
* [Installing Kendo UI with NPM]({% slug kendoui_npm_packages_kendoui_installation %})
* [Installing Kendo UI with NuGet]({% slug kendoui_nuget_packages %})
* [Getting Up and Running with Your Kendo UI Project (Guide)]({% slug getting_started_installation_kendoui %})
