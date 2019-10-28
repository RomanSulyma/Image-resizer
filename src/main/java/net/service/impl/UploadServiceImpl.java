package net.service.impl;

import net.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Service
public class UploadServiceImpl implements UploadService {

    @Autowired
    Environment environment;

    @Override
    public File uploadToServer(MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String name = file.getOriginalFilename();

                File uploadedFile = new File(environment.getProperty("rootpath") + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadedFile));
                stream.write(bytes);
                stream.flush();
                stream.close();

                return uploadedFile;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}

