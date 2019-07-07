package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Usuario;

public class UsuarioDAO extends dao {
    public void registrar(Usuario valor_usuario) throws SQLException {
        try {
            this.Conectar();
            PreparedStatement pst;
            pst = this.getCn().prepareStatement("INSERT INTO Usuario (nombre, carrera_prof) VALUES(?,?)");
            pst.setString(1, valor_usuario.getNombre());
            pst.setString(2, valor_usuario.getCarrera_prof());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
        this.Cerrar();
        }
    }
}
