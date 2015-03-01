//
//  CCubedApp.h
//  ccubed-sample
//
//  Created by Shawn White on 31/01/15.
//  Copyright (c) 2015 Andreia Gaita. All rights reserved.
//

#ifndef __ccubed_sample__CCubedCefApp__
#define __ccubed_sample__CCubedCefApp__

#include <include/cef_app.h>
#include <include/cef_application_mac.h>

class CCubedCefApp : public CefApp,
public CefBrowserProcessHandler {
public:
    // CefApp methods:
    virtual CefRefPtr<CefBrowserProcessHandler> GetBrowserProcessHandler()
    OVERRIDE { return this; }

// CefBrowserProcessHandler methods:
virtual void OnContextInitialized() OVERRIDE;

virtual void OnRegisterCustomSchemes(CefRefPtr<CefSchemeRegistrar> registrar) OVERRIDE;

private:
// Include the default reference counting implementation.
IMPLEMENT_REFCOUNTING(CCubedCefApp);
};

#endif /* defined(__ccubed_sample__CCubedCefApp__) */
