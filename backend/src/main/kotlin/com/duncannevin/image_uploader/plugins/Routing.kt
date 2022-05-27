package com.duncannevin.image_uploader.plugins

import com.duncannevin.image_uploader.routes.imageRouting
import io.ktor.server.routing.*
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.request.*

fun Application.configureRouting() {
    routing {
        imageRouting()
    }
}
