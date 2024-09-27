package com.stephanekuma.snapkeep

import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.stephanekuma.snapkeep"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        flutterEngine?.let {
            MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "getVideoThumbnailPath") {
                    val videoPath = call.argument<String>("videoPath")
                    if (videoPath != null) {
                        val thumbnailPath = getVideoThumbnailPath(videoPath)
                        if (thumbnailPath != null) {
                            result.success(thumbnailPath)
                        } else {
                            result.error("UNAVAILABLE", "Thumbnail not available.", null)
                        }
                    } else {
                        result.error("ERROR", "Video path is null", null)
                    }
                } else {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getVideoThumbnailPath(videoPath: String): String? {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(videoPath)
            val bitmap = retriever.getFrameAtTime(1000000) // Capture à 1 seconde

            val thumbnailFile = File(cacheDir, "thumbnail_${System.currentTimeMillis()}.jpg")
            FileOutputStream(thumbnailFile).use { fos ->
                bitmap?.compress(Bitmap.CompressFormat.JPEG, 100, fos)
            }

            if (thumbnailFile.exists()) {
                return thumbnailFile.absolutePath
            } else {
                null
            }
        } catch (e: Exception) {
            e.printStackTrace()
            null
        } finally {
            retriever.release()
        }
    }
}
