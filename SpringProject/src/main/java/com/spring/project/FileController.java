package com.spring.project;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FileController {

    private final String uploadDir = "C:/upload";

    @GetMapping("/copy-images")
    public ResponseEntity<String> copyImages() {
        File sourceDir = new File(uploadDir);
        File[] files = sourceDir.listFiles((dir, name) -> name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".png"));

        if (files != null) {
            for (File file : files) {
                try {
                    Path sourcePath = file.toPath();
                    Path destinationPath = Paths.get("C:/destination" + file.getName());
                    Files.copy(sourcePath, destinationPath);
                } catch (IOException e) {
                    return new ResponseEntity<>("Error copying file: " + file.getName(), HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }
            return new ResponseEntity<>("Files copied successfully!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("No image files found!", HttpStatus.NOT_FOUND);
        }
    }
}