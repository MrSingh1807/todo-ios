package com.example.todo_app.utilities

import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow


interface ClickEvents {
    fun launchNextScreen()
}

class SharedViewModel : ClickEvents {
    var eventCall = MutableStateFlow("")

    private val _events = MutableSharedFlow<String>()

    var eventHandle: (() -> Unit)? = null

    override fun launchNextScreen() {
        eventHandle?.invoke()
    }
}
