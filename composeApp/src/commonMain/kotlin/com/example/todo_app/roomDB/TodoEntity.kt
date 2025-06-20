package com.example.todo_app.roomDB

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "todo")
data class TodoEntity(
  @PrimaryKey(autoGenerate = true) val id: Long = 0,
  val title: String,
  val content: String
)