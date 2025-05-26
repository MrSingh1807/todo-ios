package com.example.todo_app.utilities

import com.example.todo_app.di.commonAppModule
import com.example.todo_app.di.platformModuleIOS
import org.koin.core.context.startKoin

class KoinInitializerIOS() : KoinInitializer {

    override fun initialize() {
        startKoin {
            modules(
                platformModuleIOS, commonAppModule
            )
        }
    }
}