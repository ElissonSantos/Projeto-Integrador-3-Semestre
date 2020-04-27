package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

public class FaleConoscoDAO {

    public static void salvarFale(FaleConosco novo) {

        try {
            Connection con = FabricaConexao.getConnection();

            String sql = "insert into faleconosco "
                    + "(nome_contato,email_contato,fone_contato,mensagem) "
                    + "values(?,?,?,?)";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, novo.getNome());
            stmt.setString(2, novo.getEmail());
            stmt.setString(3, novo.getTelefone());
            stmt.setString(4, novo.getMensagem());

            stmt.execute();

            stmt.close();

            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    
    public static ArrayList<FaleConosco> listar() {

        try {
            Connection conexao = FabricaConexao.getConnection();
            String sql = "select * from faleconosco order by idfaleConosco DESC;";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            String nome, email, mensagem, telefone;
            int id;

            ArrayList<FaleConosco> faleconosco = new ArrayList();
            while (rs.next()) {
                nome = rs.getString("nome_contato");
                email = rs.getString("email_contato");
                telefone = rs.getString("fone_contato");
                mensagem = rs.getString("mensagem");
                id = rs.getInt("idfaleConosco");

                FaleConosco novo = new FaleConosco(id, nome, email, mensagem, telefone);
                faleconosco.add(novo);
            }
            rs.close();
            stmt.close();
            conexao.close();

            return faleconosco;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}