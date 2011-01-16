// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function statuspopup() {
  window.newwindow = openWindow('/activities/select','status', 600, 400)
}

function openWindow(url, title, width, height)
{
  var navigatoreName = navigator.appName;
  if (navigatoreName == "Netscape") {
    netscape.security.PrivilegeManager.enablePrivilege('UniversalBrowserWrite');
    window.open(url, title, 'width=' + width + ', height=' + height + 
      ', chrome, centerscreen, dependent=YES, dialog=YES, modal=YES, '+
      'resizable=NO, scrollbars=NO, location=0, status=0, menubar=0, toolbar=0');
  } else {
    window.showModalDialog(url, title, "dialogHeight:" + height + 
      "; dialogWidth:" + width +"; scroll:no");
  }
} 
