package person.chb.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传工具
 * @author 陈海波
 *
 */
public class UpFileUtils {

    public static String getUrl(MultipartFile multipartFile,HttpServletRequest request)
    {
        String realPath=request.getSession().getServletContext().getRealPath("");

        //本机的项目路径
        String proPath="C:\\Users\\Administrator\\IdeaProjects\\bookstore\\src\\main\\webapp\\img";

        String savePath="img";

        File file=new File(realPath+savePath);

//		File file1=new File(proPath+savePath);

        if(!file.exists())
        {
            file.mkdirs();
        }

//		if(!file1.exists())
//		{
//			file1.mkdirs();
//		}

        String fileName=multipartFile.getOriginalFilename();

        String url=savePath+"/"+fileName;
        FileOutputStream fos=null;
//		FileOutputStream fos1=null;

        try {
            fos=new FileOutputStream(realPath+url,true);//true让文件不覆盖
            fos.write(multipartFile.getBytes());

//			fos1=new FileOutputStream(proPath+url,true);
//			fos1.write(multipartFile.getBytes());

            fos.flush();
//			fos1.flush();

            return url;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return "";
        }finally {
            try {
                fos.close();
//				fos1.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }


}
