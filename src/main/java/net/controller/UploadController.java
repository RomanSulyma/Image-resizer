package net.controller;

import net.form.ImageForm;
import net.service.ResizeService;
import net.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import javax.validation.Valid;

@Controller
public class UploadController {

    @Autowired
    ResizeService resizeService;

    @Autowired
    UploadService uploadService;

    @RequestMapping(value = "/uploadFile",method = RequestMethod.GET)
    public String uploadFileGet(){
        return "upload";
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam("file")MultipartFile multipartFile, @Valid @ModelAttribute("profileForm") ImageForm imageForm , BindingResult bindingResult, Model model) throws IOException {

        if(bindingResult.hasErrors())
            return "upload";

        File uploadedFile = uploadService.uploadToServer(multipartFile);
        model.addAttribute("path", resizeService.resizeAndConvert(uploadedFile,imageForm));

        return "success";
    }


}

