package net.service;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;

public interface UploadService {

    File uploadToServer(MultipartFile multipartFile);
}
