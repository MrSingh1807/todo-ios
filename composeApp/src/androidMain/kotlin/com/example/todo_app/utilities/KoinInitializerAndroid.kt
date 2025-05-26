package com.example.todo_app.utilities

import android.content.Context
import com.example.todo_app.di.commonAppModule
import com.example.todo_app.di.platformModuleAndroid
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin


class KoinInitializerAndroid(
    private val context: Context,
) : KoinInitializer {
    override fun initialize() {
        startKoin {
            androidContext(context)
            modules(commonAppModule, platformModuleAndroid(context))
        }
    }
}