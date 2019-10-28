package net.form;

import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class ImageForm implements Serializable {

    @NotNull
    private int height;

    @NotNull
    private int width;

    @NotEmpty
    @NotNull
    private String format;

    @NotNull
    private int size;

    boolean check = false;

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }
}
