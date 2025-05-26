package com.example.todo_app.di

import com.example.todo_app.utilities.SharedPreference
import org.koin.dsl.module

val platformModuleIOS = module {

    single {
        SharedPreference()
    }

}
