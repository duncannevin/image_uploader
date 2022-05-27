package com.duncannevin.image_uploader

import kotlinx.serialization.Serializable

@Serializable
data class CreatedResponse(val id: String, val location: String)
