package com.spring.project.common.util;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class FileWatcher {

    private static final String SOURCE_DIR = "C:\\upload";
    private static final String DEST_DIR = "/assets/upload";

    public static void main(String[] args) {
        ScheduledExecutorService executorService = Executors.newScheduledThreadPool(1);

        executorService.scheduleAtFixedRate(() -> {
            try {
                watchDirectory();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }, 0, 1, TimeUnit.SECONDS);
    }

    private static void watchDirectory() throws IOException {
        Path sourcePath = Paths.get(SOURCE_DIR);
        DirectoryStream<Path> stream = Files.newDirectoryStream(sourcePath);

        for (Path filePath : stream) {
            if (Files.isRegularFile(filePath)) {
                Path destFilePath = Paths.get(DEST_DIR, filePath.getFileName().toString());
                try {
                    Files.copy(filePath, destFilePath, StandardCopyOption.REPLACE_EXISTING);
                    System.out.println("Copied: " + filePath + " to " + destFilePath);
                    // 파일 복사 후 파일을 삭제하거나 이동할 수 있습니다.
                    Files.delete(filePath); // 원본 파일 삭제 예시
                } catch (IOException e) {
                    System.err.println("Failed to copy file: " + e.getMessage());
                }
            }
        }
    }
}