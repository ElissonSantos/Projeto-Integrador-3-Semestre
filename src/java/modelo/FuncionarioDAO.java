package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FuncionarioDAO {

    public static Funcionario logar(String em, String se) {
        
           try {
            Connection conexao = FabricaConexao.getConnection();
            String sql = "select * from funcionarios where email_funcionario=? and senha_funcionario=?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1,em);
            stmt.setString(2,se);
            
            ResultSet rs = stmt.executeQuery();
            String nome, email, senha;
            int id;
            Funcionario logado=null;
            if ( rs.first() ) {
                nome = rs.getString("nome_funcionario");
                senha = rs.getString("senha_funcionario");
                email = rs.getString("email_funcionario");
                id = rs.getInt("id_funcionario");

                logado = new Funcionario(id, nome, email, senha);
            }
            rs.close();
            stmt.close();
            conexao.close();

            return logado;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        
    }
}