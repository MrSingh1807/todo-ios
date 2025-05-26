package com.example.todo_app.di

import android.content.Context
import com.example.todo_app.utilities.SharedPreference
import org.koin.android.ext.koin.androidApplication
import org.koin.dsl.module

fun platformModuleAndroid(context: Context) = module {

    single {
        androidApplication()
    }

    single<Context> { context }

    single {
        SharedPreference(get())
    }

}
