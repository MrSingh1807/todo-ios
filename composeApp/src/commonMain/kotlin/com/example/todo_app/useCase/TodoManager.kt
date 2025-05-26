package com.example.todo_app.useCase

import com.example.todo_app.repositories.TodoRepository
import com.example.todo_app.roomDB.AppDatabase
import com.example.todo_app.roomDB.TodoEntity

class TodoManager(db: AppDatabase) {
    val repository = TodoRepository(db)

    suspend fun insertTodo(todo: String) {
        repository.insert(TodoEntity(1L,todo,""))
    }

}