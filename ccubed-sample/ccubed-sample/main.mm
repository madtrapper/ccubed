//
//  main.m
//  ccubed-sample
//
//  Created by Andreia Gaita on 1/31/15.
//  Copyright (c) 2015 Andreia Gaita. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

#include "CCubedApp.h"
#include "RequestHandler.h"
#include "File.h"

// Entry point function for the browser process.
int main(int argc, char* argv[]) {

	NSString* dirpath = [[NSFileManager defaultManager] currentDirectoryPath];
	//dirpath = [dirpath stringByDeletingLastPathComponent];
	
	dirpath = [dirpath stringByAppendingPathComponent:@"ccubed-sample.app"];
	dirpath = [dirpath stringByAppendingPathComponent:@"Contents"];
	dirpath = [dirpath stringByAppendingPathComponent:@"Resources"];

	File::SetExecDir([dirpath UTF8String]);

    // Provide CEF with command-line arguments.
    CefMainArgs main_args(argc, argv);
    
    // SimpleApp implements application-level callbacks. It will create the first
    // browser instance in OnContextInitialized() after CEF has initialized.
    
    CCubedApp* app = new CCubedApp();
    app->Initialize();
    
    // Initialize the SimpleApplication instance.
    [CCubedSampleApplication sharedApplication];
    
    // Specify CEF global settings here.
    CefSettings settings;
    
    // Initialize CEF for the browser process.
    CefInitialize(main_args, settings, app->GetCef().get(), NULL);
	
	CefRegisterSchemeHandlerFactory("client", "ccubed", new ClientSchemeHandlerFactory());
	
    // Create the application delegate.
    NSObject* delegate = [[AppDelegate alloc] init];
    [delegate performSelectorOnMainThread:@selector(createApp:) withObject:nil
                            waitUntilDone:NO];
    
    // Run the CEF message loop. This will block until CefQuitMessageLoop() is
    // called.
    CefRunMessageLoop();
    
    // Shut down CEF.
    CefShutdown();
    
    return 0;
}