package com.example.todo_app.di

import com.example.todo_app.repositories.TodoRepository
import com.example.todo_app.roomDB.AppDatabase
import com.example.todo_app.roomDB.AppDatabaseConstructor
import com.example.todo_app.utilities.ClickEvents
import com.example.todo_app.utilities.SharedViewModel
import org.koin.dsl.module


val commonAppModule = module {

    single <ClickEvents> {
        SharedViewModel()
    }

    single<AppDatabase> { AppDatabaseConstructor.initialize() }

    single<TodoRepository> { TodoRepository(get()) }

}
