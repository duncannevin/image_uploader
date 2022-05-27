package com.duncannevin.image_uploader.routes

import io.ktor.client.request.*
import io.ktor.client.request.forms.*
import io.ktor.http.*
import io.ktor.server.testing.*
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

class ImageRoutingTest {
    @Test
    fun testPostImage() = testApplication {
        val boundary = "WebAppBoundary"
        val response = client.post("/") {
            setBody(
                MultiPartFormDataContent(
                    formData {
                        append("image", File("profile.jpg").readBytes(), Headers.build {
                            append(HttpHeaders.ContentType, "multipart/form-data")
                            append(HttpHeaders.ContentDisposition, "filename=\"profile.jpg\"")
                        })
                    },
                    boundary,
                    ContentType.MultiPart.FormData.withParameter("boundary", boundary)
                )
            )
        }
        assertEquals(HttpStatusCode.Created, response.status)
    }
    @Test
    fun testPostImageIncorrectExtension() = testApplication {
        val boundary = "WebAppBoundary"
        val response = client.post("/") {
            setBody(
                MultiPartFormDataContent(
                    formData {
                        append("notimage", File("gradlew.bat").readBytes(), Headers.build {
                            append(HttpHeaders.ContentType, "multipart/form-data")
                            append(HttpHeaders.ContentDisposition, "filename=\"gradlew.bat\"")
                        })
                    },
                    boundary,
                    ContentType.MultiPart.FormData.withParameter("boundary", boundary)
                )
            )
        }
        assertEquals(HttpStatusCode.BadRequest, response.status)
    }
    @Test
    fun getImage() = testApplication {
        val response = client.get("/tester.jpg")
        assertEquals(HttpStatusCode.OK, response.status)
    }
}