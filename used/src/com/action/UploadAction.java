package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.util.VeDate;

public class UploadAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	// 封装上传文件域的属性
	private File image;
	// 封装上传文件类型的属性
	private String imageContentType;
	// 封装上传文件名的属性
	private String imageFileName;
	// 接受依赖注入的属性
	private String savePath;

	public String image() {
		FileOutputStream fos = null;
		FileInputStream fis = null;
		int i = getImageFileName().indexOf(".");
		String name = String.valueOf(VeDate.getStringDatex());
		String type = getImageFileName().substring(i + 1);
		this.setImageFileName(name + "." + type);
		this.setSavePath("upfiles");
		try {
			// 建立文件输出流
			fos = new FileOutputStream(getSavePath() + "\\" + getImageFileName());
			// 建立文件上传流
			fis = new FileInputStream(getImage());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (Exception e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		} finally {
			close(fos, fis);
		}
		return "success";
	}

	public String files() {
		FileOutputStream fos = null;
		FileInputStream fis = null;
		int i = getImageFileName().indexOf(".");
		String name = String.valueOf(VeDate.getStringDatex());
		String type = getImageFileName().substring(i + 1);
		this.setImageFileName(name + "." + type);
		this.setSavePath("upfiles");
		try {
			// 建立文件输出流
			fos = new FileOutputStream(getSavePath() + "\\" + getImageFileName());
			// 建立文件上传流
			fis = new FileInputStream(getImage());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (Exception e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
		} finally {
			close(fos, fis);
		}
		return "success";
	}

	/**
	 * 返回上传文件的保存位置
	 * 
	 * @return
	 */
	public String getSavePath() throws Exception {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	private void close(FileOutputStream fos, FileInputStream fis) {
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {
				System.out.println("FileInputStream关闭失败");
				e.printStackTrace();
			}
		}
		if (fos != null) {
			try {
				fos.close();
			} catch (IOException e) {
				System.out.println("FileOutputStream关闭失败");
				e.printStackTrace();
			}
		}
	}
}
