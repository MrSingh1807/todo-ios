package com.example.todo_app.repositories

import com.example.todo_app.roomDB.AppDatabase
import com.example.todo_app.roomDB.AppDatabaseConstructor
import com.example.todo_app.roomDB.TodoDao
import com.example.todo_app.roomDB.TodoEntity
import kotlinx.coroutines.flow.Flow

class TodoRepository(appDatabase: AppDatabase) {
    private val dao: TodoDao = appDatabase.getDao()


    suspend fun insert(item: TodoEntity) = dao.insert(item)

    suspend fun count(): Int = dao.count()

//    @NativeCoroutines
    fun getAllAsFlow(): Flow<List<TodoEntity>> = dao.getAllAsFlow()

}
