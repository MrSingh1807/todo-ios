package com.example.todo_app

import android.app.Application
import com.example.todo_app.utilities.KoinInitializerAndroid

class ToDoApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        KoinInitializerAndroid(this).initialize()

    }
}