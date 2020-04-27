package modelo;
//DATA ACCESS OBJECT
//DATE    <==  LocalDATE

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

public class NoticiaDAO {

    public static ArrayList<Noticia> listar() {

        try {
            Connection conexao = FabricaConexao.getConnection();
            String sql = "select * from noticias order by idnoticias DESC";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            String titulo, corpo, urlImg;
            int id;

            ArrayList<Noticia> noticias = new ArrayList();
            while (rs.next()) {
                titulo = rs.getString("titulo_noticia");
                corpo = rs.getString("corpo_noticia");
                urlImg = rs.getString("img_noticia");
                id = rs.getInt("idnoticias");

                Noticia novo = new Noticia(id, titulo, corpo, urlImg);
                noticias.add(novo);
            }
            rs.close();
            stmt.close();
            conexao.close();

            return noticias;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static void editar(Noticia novo) {

        try {
            Connection con = FabricaConexao.getConnection();

            String sql = "UPDATE noticias SET titulo_noticia = ?, corpo_noticia = ?,"
                    + "img_noticia = ? WHERE idnoticias = ?;";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, novo.getTitulo());
            stmt.setString(2, novo.getCorpo());
            stmt.setString(3, novo.getUrlImg());
            stmt.setInt(4, novo.getId());
            stmt.execute();

            stmt.close();

            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static void cadastrar(Noticia novo) {

        try {
            Connection con = FabricaConexao.getConnection();

            String sql = "insert into noticias "
                    + "(titulo_noticia,corpo_noticia,img_noticia) "
                    + "values(?,?,?)";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, novo.getTitulo());
            stmt.setString(2, novo.getCorpo());
            stmt.setString(3, novo.getUrlImg());
            stmt.execute();

            stmt.close();

            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static void deletar(int id) {

        try {
            Connection con = FabricaConexao.getConnection();

            String sql = "DELETE FROM noticias WHERE idnoticias = ?;";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, id);
            stmt.execute();

            stmt.close();

            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}
