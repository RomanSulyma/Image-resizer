package net.service.impl;

import net.form.ImageForm;
import net.service.ResizeService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
public class ResizeServiceImpl implements ResizeService {

    @Autowired
    Environment environment;

    @Override
    public String resizeAndConvert(File uploadedFile , ImageForm imageForm) {

        try {
        String name = FilenameUtils.getBaseName(uploadedFile.getName()) + "-ready" + "." + imageForm.getFormat();
        BufferedImage bufferedImage = ImageIO.read(uploadedFile);

        if(imageForm.isCheck())
            bufferedImage = Scalr.resize(bufferedImage,Scalr.Method.ULTRA_QUALITY,imageForm.getSize());
        else
            bufferedImage = Scalr.resize(bufferedImage,Scalr.Mode.FIT_EXACT,imageForm.getWidth(),imageForm.getHeight());

        OutputStream os = Files.newOutputStream(Paths.get(environment.getProperty("rootpath") + File.separator + name));
        ImageIO.write(bufferedImage, imageForm.getFormat(), os);
        os.flush();
        os.close();

        return name;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return  null;
    }

    @Override
    @Scheduled(cron = "0 59 23 * * *")
    public void deleteFiles() {
        try {
            FileUtils.cleanDirectory(new File(environment.getProperty("rootpath")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
