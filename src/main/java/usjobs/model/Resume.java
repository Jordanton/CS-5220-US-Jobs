package usjobs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
@Entity
@Table(name = "resumes")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Resume implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "resume_id")
    @GeneratedValue
    private Integer id;

    private String name;

    @Column(name = "upload_date")
    private Date uploadDate;

    @Column(name = "file_path")
    private String filePath;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_data")
    private byte[] fileData;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Type(type = "text")
    private String content;

    public Integer getId() {

        return id;
    }

    public void setId( Integer id ) {

        this.id = id;
    }

    public String getName() {

        return name;
    }

    public void setName( String name ) {

        this.name = name;
    }

    public Date getUploadDate() {

        return uploadDate;
    }

    public void setUploadDate( Date uploadDate ) {

        this.uploadDate = uploadDate;
    }

    public String getFileName() {

        return fileName;
    }

    public void setFileName( String fileName ) {

        this.fileName = fileName;
    }

    public byte[] getFileData() {

        return fileData;
    }

    public void setFileData( byte[] fileData ) {

        this.fileData = fileData;
    }

    public User getUser() {

        return user;
    }

    public void setUser( User user ) {

        this.user = user;
    }

    public String getFilePath() {

        return filePath;
    }

    public void setFilePath( String filePath ) {

        this.filePath = filePath;
    }

    public String getContent() {

        return content;
    }

    public void setContent( String content ) {

        this.content = content;
    }

}
