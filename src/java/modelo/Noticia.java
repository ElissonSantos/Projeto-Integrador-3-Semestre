package modelo;

import java.time.LocalDate;

public class Noticia {
    
    private int id;
    private String titulo;
    private String corpo;
    private String urlImg;

    public Noticia() {
    }

    public Noticia(int id, String titulo, String corpo, String urlImg) {
        this.id = id;
        this.titulo = titulo;
        this.corpo = corpo;
        this.urlImg = urlImg;
    }

    public Noticia(String titulo, String corpo, String urlImg) {
        this.titulo = titulo;
        this.corpo = corpo;
        this.urlImg = urlImg;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCorpo() {
        return corpo;
    }

    public void setCorpo(String corpo) {
        this.corpo = corpo;
    }    

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }
    
}
