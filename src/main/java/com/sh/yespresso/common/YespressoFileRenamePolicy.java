package com.sh.yespresso.common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class YespressoFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		do {
			// 20230103-12345.txt
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-");
			DecimalFormat df = new DecimalFormat("00000"); // 0은 해당자리수가 없어도 0으로 채움.

			String filename = oldFile.getName();
			String ext = "";
			int dot = filename.lastIndexOf(".");
			if (dot > -1) {
				ext = filename.substring(dot);

			}

			String newFilename = sdf.format(new Date()) + df.format(Math.random() * 100000) + ext;
			newFile = new File(oldFile.getParent(), newFilename);

		} while (!createNewFile(newFile));
		System.out.println(newFile);
		return newFile;
	}

	/**
	 * f가 실제 존재하지 않으면 파일 생성 후 true 반환 f가 존재하면 파일 생성 하지 않고 false 반환
	 * 
	 * @param f
	 * @return
	 */
	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		} catch (IOException ignored) {
			return false;
		}
	}

}
