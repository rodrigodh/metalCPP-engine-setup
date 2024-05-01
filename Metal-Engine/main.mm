//
//  mtl_engine.m
//  Metal-Tutorial
//
//  Created by Rodrigo Schieck on 01/05/24.
//

#include <Metal/Metal.hpp>
#include <iostream>
#include "mtl_engine.hpp"

int main() {

    MTLEngine engine;
    engine.init();
    engine.run();
    engine.cleanup();

    return 0;
}
