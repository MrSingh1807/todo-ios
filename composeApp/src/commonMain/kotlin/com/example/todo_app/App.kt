package com.example.todo_app

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.safeContentPadding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import com.example.todo_app.utilities.ClickEvents
import com.example.todo_app.utilities.SharedPreference
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.ui.tooling.preview.Preview
import org.koin.compose.koinInject

import todo_app.composeapp.generated.resources.Res
import todo_app.composeapp.generated.resources.compose_multiplatform

@Composable
@Preview
fun App() {

    val sharedPref: SharedPreference = koinInject()
    val clickEvents: ClickEvents = koinInject()

    MaterialTheme {
        var showContent by remember { mutableStateOf(false) }
        Column(
            modifier = Modifier
                .safeContentPadding()
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Button(onClick = { showContent = !showContent }) {
                Text("Click me!")

                sharedPref.run {
                    val name = getString("Name")
                    val age = getInt("Age")
                    print("Result : - $name , $age")
                }
            }

            Button(onClick = {
                sharedPref.run {
                    save("Name", "Mr_Singh")
                    save("Age", 23)
                    save("Path", "Onboard")
                }
                clickEvents.launchNextScreen()
            }) {
                Text("Next Screen")
            }
            AnimatedVisibility(showContent) {
                val greeting = remember { Greeting().greet() }
                Column(Modifier.fillMaxWidth(), horizontalAlignment = Alignment.CenterHorizontally) {
                    Image(painterResource(Res.drawable.compose_multiplatform), null)
                    Text("Compose: $greeting")
                }
            }
        }
    }
}