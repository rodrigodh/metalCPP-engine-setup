//
//  mtl_engine.m
//  Metal-Tutorial
//
//  Created by Rodrigo Schieck on 01/05/24.
//

#import <Foundation/Foundation.h>
#include "mtl_engine.hpp"

void MTLEngine::init() {
    initDevice();
    initWindow();
}

void MTLEngine::run() {
    while (!glfwWindowShouldClose(glfwWindow)) {
        glfwPollEvents();
    }
}

void MTLEngine::cleanup() {
    glfwTerminate();
    metalDevice->release();
}

void MTLEngine::initDevice() {
    metalDevice = MTL::CreateSystemDefaultDevice();
}

void MTLEngine::initWindow() {
    glfwInit();
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API); // We use this function to avoid starting the window with opengl graphics context.
    
    int width = 800;
    int height = 600;
    const char *windowName = "Digout";

    glfwWindow = glfwCreateWindow(width, height, windowName, NULL, NULL);
    if (!glfwWindow) {
        glfwTerminate();
        exit(EXIT_FAILURE);
    }

    metalWindow = glfwGetCocoaWindow(glfwWindow);
    metalLayer = [CAMetalLayer layer];
    metalLayer.device = (__bridge id<MTLDevice>)metalDevice;
    metalLayer.pixelFormat = MTLPixelFormatBGRA8Unorm;
    metalWindow.contentView.layer = metalLayer;
    metalWindow.contentView.wantsLayer = YES;
}
