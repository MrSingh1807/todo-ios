package com.example.todo_app.utilities

import android.content.Context
import android.content.SharedPreferences

actual class SharedPreference(private val context: Context) {

    private val sharedPreferences: SharedPreferences =
        context.getSharedPreferences("app_prefs", Context.MODE_PRIVATE)

    actual fun save(key: String, value: String) {
        sharedPreferences.edit().putString(key, value).apply()
    }

    actual fun save(key: String, value: Int) {
        sharedPreferences.edit().putInt(key, value).apply()
    }

    actual fun save(key: String, value: Float) {
        sharedPreferences.edit().putFloat(key, value).apply()
    }

    actual fun save(key: String, value: Long) {
        sharedPreferences.edit().putLong(key, value).apply()
    }

    actual fun save(key: String, value: Boolean) {
        sharedPreferences.edit().putBoolean(key, value).apply()
    }

    actual fun getString(key: String, defaultValue: String?): String {
        return sharedPreferences.getString(key, defaultValue ?: "") ?: ""
    }

    actual fun getInt(key: String, defaultValue: Int?): Int {
        return sharedPreferences.getInt(key, defaultValue ?: 0)
    }

    actual fun getFloat(key: String, defaultValue: Float?): Float {
        return sharedPreferences.getFloat(key, defaultValue ?: 0.0f)
    }

    actual fun getLong(key: String, defaultValue: Long?): Long {
        return sharedPreferences.getLong(key, defaultValue ?: 0L)
    }

    actual fun getBoolean(key: String, defaultValue: Boolean?): Boolean {
        return sharedPreferences.getBoolean(key, defaultValue ?: false)
    }

    actual fun removeKey(key: String) {
        sharedPreferences.edit().remove(key).apply()
    }

    actual fun clear() {
        sharedPreferences.edit().clear().commit()
    }
}