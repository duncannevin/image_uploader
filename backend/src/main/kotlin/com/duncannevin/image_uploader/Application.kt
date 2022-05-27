package com.duncannevin.image_uploader

import com.duncannevin.image_uploader.plugins.configureHTTP
import com.duncannevin.image_uploader.plugins.configureRouting
import com.duncannevin.image_uploader.plugins.configureSecurity
import com.duncannevin.image_uploader.plugins.configureSerialization
import io.ktor.server.application.*

fun main(args: Array<String>): Unit =
    io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // application.conf references the main function. This annotation prevents the IDE from marking it as unused.
fun Application.module() {
    configureRouting()
    configureSecurity()
    configureHTTP()
    configureSerialization()
}
