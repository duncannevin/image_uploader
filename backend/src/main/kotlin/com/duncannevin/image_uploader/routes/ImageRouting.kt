package com.duncannevin.image_uploader.routes

import com.duncannevin.image_uploader.CreatedResponse
import io.ktor.http.*
import io.ktor.http.content.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import java.io.File

fun Route.imageRouting() {
    val uploadsLocation = environment?.config?.propertyOrNull("ktor.application.uploads_location")?.getString()
    val domain = environment?.config?.propertyOrNull("ktor.application.domain")?.getString()

    post {
        // retrieve all multipart data (suspending)
        val multipart = call.receiveMultipart()
        val id = java.util.UUID.randomUUID()
        var fileName = ""
        var error = false
        var extension = ""

        multipart.forEachPart { part ->
            when (part) {
                is PartData.FileItem -> {
                    val originalFileName = part.originalFileName!!
                    extension = originalFileName.split(".").last()

                    when (extension) {
                        "png", "jpg" -> {
                            fileName = "image-$id.$extension"
                            var fileBytes = part.streamProvider().readBytes()
                            File("$uploadsLocation/$fileName").writeBytes(fileBytes)
                        }
                        else -> error = true
                    }
                }
            }
        }

        if (error) {
            call.respondText("Invalid extension: $extension", status = HttpStatusCode.BadRequest)
        } else {
            call.respond(status = HttpStatusCode.Created, CreatedResponse(id = fileName, location = "$domain/$fileName"))
        }
    }
    get("/{id}") {
        val filename = call.parameters["id"] ?: return@get call.respondText("Missing Id", status = HttpStatusCode.BadRequest)

        val file = File("$uploadsLocation/$filename")

        if (file.exists()) {
            call.respondFile(file)
        } else {
            call.respond(HttpStatusCode.NotFound)
        }
    }
}
