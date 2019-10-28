package net.service;

import net.form.ImageForm;
import java.io.File;

public interface ResizeService {

    String resizeAndConvert(File uploadedFile, ImageForm imageForm);

    void deleteFiles();

}
