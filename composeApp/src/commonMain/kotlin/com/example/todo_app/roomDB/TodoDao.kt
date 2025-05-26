package com.example.todo_app.roomDB

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import kotlinx.coroutines.flow.Flow


@Dao
interface TodoDao {
  @Insert
  suspend fun insert(item: TodoEntity)

  @Query("SELECT count(*) FROM todo")
  suspend fun count(): Int

  @Query("SELECT * FROM todo")
  fun getAllAsFlow(): Flow<List<TodoEntity>>
}
